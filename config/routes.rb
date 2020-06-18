Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :actors
      resources :comments
      resources :events
      resources :films
      resources :follows
      resources :likes
      resources :notifications
      resources :saved_messages
      resources :tweets

      root to: "users#index"
    end
  get 'saved_messages/index'
  get 'saved_messages/new'
  get 'saved_messages/create'
  get 'saved_messages/show'
  get 'saved_messages/edit'
  get 'saved_messages/update'
  get 'saved_messages/destroy'
  resources :tweets do
    member do
      post :retweet
    end
  end

  resources :saved_messages

  # SAME RESULT ADD SCOPE TO THE FOLDER STRUCTURE
  # resources :tweets, module: 'admin'
  # scope module: "admin" do
  #   resources :tweets
  # end
  
  # ADD SCOPE TO THE URL
  # scope '/admin' do
  #   resources :tweets
  # end

  # ADD SCOPE TO BOTH URL AND FOLDER STRUCTURE
  # namespace 'admin' do
  #   resources :tweets
  # end

  # concern :actorable do
  #   resources :actors
  # end

  # resources :users, concerns: :actorable


  root 'home#index'
  resources :events
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :users, only: [:destroy] do
    member do
      post :follow
    end
  end

  resources :actors do
    member do
      post :bookmark
    end
    resources :comments, module: :actors, only: [:create, :destroy]
    resources :likes, module: :actors, only: [:create, :destroy]
  end

  resources :films do
    resources :comments, module: :films, only: [:create, :destroy]
    resources :likes, module: :films, only: [:create, :destroy]
  end

  resources :follows, only: [:create, :destroy]
  # delete 'films/:film_id/likes', to: 'likes#destroy', module: :films
  # delete 'actors/:actor_id/likes', to: 'likes#destroy', module: :actors
end
