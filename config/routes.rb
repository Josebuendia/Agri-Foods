Rails.application.routes.draw do
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
  resources :orders do 
    resources:orderitems
  end

  devise_for :users do 
    resources :orders 
  end  

  get '/checkout' => 'cart#createOrder'

  get 'cart/index'
  resources :items
root 'static_pages#home'
  get '/contact' => 'static_pages#contact'

  get '/about' => 'static_pages#about'

  get '/login' => 'user#login'
  get '/logout' => 'user#logout'


  get '/cart/clear', to: 'cart#clearCart'
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/clearcart', to: 'cart#clearCart'
  get '/cart/remove/:id' => 'cart#remove'

  get '/cart/decrease/:id' => 'cart#decrease'
  #root :to => 'site#home'
  #get 'static_pages/home'
  #get 'static_pages/contact'
  #get 'static_pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end