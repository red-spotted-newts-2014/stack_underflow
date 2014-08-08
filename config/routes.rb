Rails.application.routes.draw do

  resources :questions

  devise_for :users
  root to: "question#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'questions#index'
end
