Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post :product, to: 'product#create'
      get :products, to: 'product#index'
      post 'create_product_varient', to: 'products_varients#create_product_varient'
      get 'product_and_varients/:product_id', to: 'product#fetch_product_and_its_varients'
      resource :varient
    end
  end


  #resource :product_varient
end
