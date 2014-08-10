Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  resources :questions do
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
  end

  resources :answers do
    member do
      put "like", to: "answers#upvote"
      put "dislike", to: "answers#downvote"
    end
  end

  resources :tags

  get '/question/unanswered', to: 'questions#unanswered', as: 'unanswered_question'

  post '/questions/create', to: 'questions#create'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
