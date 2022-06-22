Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords],controllers:{
    registrations: "public/registrations",
    sessions:'public/sessions'
  }

  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :genres,only:[:new,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    resources :items
  end

end
