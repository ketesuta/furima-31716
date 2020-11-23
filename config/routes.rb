Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  devise_for :users

  root to: "items#index"
  reso
end
