Rails.application.routes.draw do
  resource :kanban, only: [:show]

  resources :work_flows, only: [:show]

  resources :steps, only: [:new, :edit, :update]

  resources :items, only: [:index, :show, :new, :edit]

  resources :pages, only: [:index, :show]

  root to: 'pages#index'
end
