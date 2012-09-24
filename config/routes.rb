AuthEng::Engine.routes.draw do
  
  devise_for :users,  :class_name => "AuthEng::User",
                      :controllers => { :sessions => 'devise/sessions',
                                        :registrations => 'devise/registrations',
                                        :passwords => 'devise/passwords',
                                        :confirmations => 'auth_eng/confirmations'},
                      :path_names => {  :sign_out => 'logout',
                                        :sign_in => 'login',
                                        :sign_up => 'register' }
                                                        
  devise_scope :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  
  resources :users

  
  root :to => "users#index"
  
end
