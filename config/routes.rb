Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :actors do
    resources :comments, module: :actors, only: [:create, :destroy]
    resources :likes, module: :actors, only: [:create]
  end

  resources :films do
    resources :comments, module: :films, only: [:create, :destroy]
    resources :likes, module: :films, only: [:create]
  end
  delete 'films/:film_id/likes', to: 'likes#destroy', module: :films
  delete 'actors/:actor_id/likes', to: 'likes#destroy', module: :actors
end
