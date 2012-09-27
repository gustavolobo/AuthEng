module AuthEng
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable
  
    # Setup accessible (or protected) attributes for your model
    attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :role_id
    # attr_accessible :title, :body
    
    validates_presence_of :name, :role_id
    
    belongs_to :role
    
    if table_exists?
      if column_names.include?("deleted_at")
        acts_as_paranoid :column => 'deleted_at', :type => 'time'
      end
    end
    
    def only_if_unconfirmed
      pending_any_confirmation {yield}
    end
    
    # new function to set the password without knowing the current password used in our confirmation controller. 
    def attempt_set_password(params)
      p = {}
      p[:password] = params[:password]
      p[:password_confirmation] = params[:password_confirmation]
      update_attributes(p)
    end
    
    # new function to return whether a password has been set
    def has_no_password?
      self.encrypted_password.blank?
    end
    
    # Password is required if it is being set, but not for new records
    def password_required?
      if !persisted? 
        false
      else
        !password.nil? || !password_confirmation.nil?
      end
    end
    
    def send_on_create_confirmation_instructions
      Devise::Mailer.delay.confirmation_instructions(self)
    end
    
    def role?(role_name)
      self.role.name == role_name ? true : false
    end
  end
end
