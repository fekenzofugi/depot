Rails.application.routes.draw do

  # as 'store_index' tells Rails to create store_index_path and store_index_url
  root 'store#index', as: 'store_index'
  
  resources :products
end
