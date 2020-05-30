Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers, params: :_id
  resources :vendors, params: :_id
  resources :products, params: :_id
  resources :invoices, params: :_id
  get 'entity/invoices', to: "invoices#show_based_on_entity"
  root to: "application#welcome"
end
