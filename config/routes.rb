Rails.application.routes.draw do
  resources :items, only: [:new]

  resources :pages, only: [:index, :show]
end
