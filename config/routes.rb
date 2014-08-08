Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  resources :questions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
