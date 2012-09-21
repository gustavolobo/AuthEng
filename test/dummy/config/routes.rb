Rails.application.routes.draw do

  mount AuthEng::Engine => "/auth_eng"
end
