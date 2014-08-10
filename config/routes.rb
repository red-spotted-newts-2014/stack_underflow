Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  resources :questions
  resources :tags

  get '/question/unanswered', to: 'questions#unanswered', as: 'unanswered_question'

  post '/questions/create', to: 'questions#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
