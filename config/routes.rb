Blogger::Application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors
  resources :author_sessions, only: [:new, :create, :destroy]

  root to: 'articles#index'

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
