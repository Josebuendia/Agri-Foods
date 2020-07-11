Rails.application.routes.draw do
  resources :items
root 'static_pages#home'
  get '/contact' => 'static_pages#contact'

  get '/about' => 'static_pages#about'

  #get 'static_pages/home'
  #get 'static_pages/contact'
  #get 'static_pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
