Rails.application.routes.draw do
  root 'basics#splash'

  devise_for :users

  get :about, to: 'basics#about'
end
