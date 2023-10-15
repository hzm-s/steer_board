Rails.application.routes.draw do
  resource :kanban, only: [:show]

  resources :work_flows, only: [:show]

  resources :steps, only: [:new, :show, :edit, :update] do
    resources :arrival_rules, only: [:index], module: :step
    resources :departure_rules, only: [:index], module: :step
  end

  resources :items, only: [:index, :show, :new, :edit] do
    resources :departure_checks, only: [:show], module: :item
  end

  resources :pages, only: [:index, :show]

  root to: 'pages#index'
end
