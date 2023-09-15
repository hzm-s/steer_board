Rails.application.routes.draw do
  resource :kanban, only: [:show]

  resources :items, only: [:new, :index]

  resources :pages, only: [:index, :show]
end
