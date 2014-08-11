Rails.application.routes.draw do

  devise_for :users
  root to: "questions#index"

  resources :questions do
    resources :responses, :only => [:create]
    member do
      put "like", to: "questions#upvote"
      put "dislike", to: "questions#downvote"
    end
    resources :answers do
      member do
        put "like", to: "answers#upvote"
        put "dislike", to: "answers#downvote"
      end
    end    
  end



  resources :tags
  

  get '/question/unanswered', to: 'questions#unanswered', as: 'unanswered_question'

  post '/questions/create', to: 'questions#create'

  post '/responses/create', to: 'responses#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
