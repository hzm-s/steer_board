Rails.application.routes.draw do
  resource :kanban, only: [:show] do
    resource :setting, only: [:show], module: :kanban
  end

  resources :steps, only: [:new]
  resources :items, only: [:index, :show, :new, :edit]

  resources :pages, only: [:index, :show]

  root to: 'pages#index'
end
