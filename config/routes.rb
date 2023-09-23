Rails.application.routes.draw do
  resource :kanban, only: [:show]

  resources :items, only: [:index, :show, :new, :edit]

  resources :pages, only: [:index, :show]
end
