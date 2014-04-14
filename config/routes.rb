Blogger::Application.routes.draw do
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :authors

  root to: 'articles#index'

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
end
