Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top_products' => "product_details#top_products"
  post 'add_product' => "product_details#create"
end
