Rails.application.routes.draw do

  devise_for :customers,skip:[:passwords],controllers:{
    registrations: "public/registrations",
    sessions:'public/sessions'
  }

  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/'=> 'public/homes#top'

  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  namespace :public do
    get 'customers/unsubscribe'=>"customers#unsubscribe"
    patch 'customers/withdraw'=>"customers#withdraw"
    resources :customers,only:[:show,:edit,:update,:unsubscribe,:withdraw]
  end

  namespace :public do
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    get '/'=>"homes#top"
  end

  namespace :admin do
    resources :genres,only:[:index,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    resources :items
  end

  namespace :admin do
    resources :customers,only:[:index,:show,:edit,:update,:destroy]
  end

  namespace :admin do
    resources :orders,only:[:index,:show,:destroy]
  end

   namespace :admin do
     resources :order_details,only:[:show,:destroy]
  end

end
