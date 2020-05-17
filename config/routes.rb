Rails.application.routes.draw do
  root 'home#index'
  resources :events
  devise_for :users, :controllers => {:registrations => "registrations"}
  
  resources :users do
    member do
      post :follow
    end
  end
  resources :actors do
    resources :comments, module: :actors, only: [:create, :destroy]
    resources :likes, module: :actors, only: [:create, :destroy]
  end

  resources :films do
    resources :comments, module: :films, only: [:create, :destroy]
    resources :likes, module: :films, only: [:create, :destroy]
  end
  # delete 'films/:film_id/likes', to: 'likes#destroy', module: :films
  # delete 'actors/:actor_id/likes', to: 'likes#destroy', module: :actors
end
