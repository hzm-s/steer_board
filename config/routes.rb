Rails.application.routes.draw do
  resource :kanban, only: [:show]

  resources :work_flows, only: [:show]

  resources :steps, only: [:new, :show, :edit, :update] do
    resources :arrival_rules, only: [:edit], module: :step
  end

  resources :items, only: [:index, :show, :new, :edit]

  resources :pages, only: [:index, :show]

  root to: 'pages#index'
end
