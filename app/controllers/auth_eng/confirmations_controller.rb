require_dependency "auth_eng/application_controller"

module AuthEng
  class ConfirmationsController < Devise::PasswordsController
    # Remove the first skip_before_filter (:require_no_authentication) if you
    # don't want to enable logged users to access the confirmation page.
    skip_before_filter :require_no_authentication
    skip_before_filter :authenticate_user!
    
    # PUT /resource/confirmation
    def update
      params[:confirmation_token] ||= params[:user][:confirmation_token]
      @confirmation_token = params[:user][:confirmation_token]
      with_unconfirmed_confirmable do
        if @confirmable.has_no_password?
          @confirmable.attempt_set_password(params[:user])
          if @confirmable.valid?
            do_confirm
          else
            do_show
            @confirmable.errors.clear #so that we wont render :new
          end
        else
          self.class.add_error_on(self, :email, :password_allready_set)
        end
      end
      if !@confirmable.errors.empty?
        do_show #Change this if you don't have the views on default path
      end
    end
    
    # GET /resource/confirmation?confirmation_token=abcdef
    def show
      params[:confirmation_token] ||= params[:user][:confirmation_token]
      with_unconfirmed_confirmable do
        if @confirmable.has_no_password?
          do_show
        else
          do_confirm
        end
      end
      if !@confirmable.errors.empty?
        render 'auth_eng/confirmations/show' #Change this if you don't have the views on default path 
      end
    end
    
    protected
    
    def with_unconfirmed_confirmable
      @confirmable = User.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token])
      if !@confirmable.new_record?
        @confirmable.only_if_unconfirmed {yield}
      end
    end
    
    def do_show
      @confirmation_token = params[:confirmation_token]
      @requires_password = true
      self.resource = @confirmable
      render 'auth_eng/confirmations/show' #Change this if you don't have the views on default path
    end
    
    def do_confirm
      @confirmable.confirm!
      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, @confirmable)
    end
  end
end