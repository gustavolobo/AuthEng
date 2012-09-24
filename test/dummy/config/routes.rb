Rails.application.routes.draw do
  
  root :to => "pages#home"
  
  get "pages/home"

  get "pages/show"

  mount AuthEng::Engine => "/auth_eng"
end
