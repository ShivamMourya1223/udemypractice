Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
    get 'pages/about',to: 'pages#about'
  get 'pages/home',to: 'pages#home'
  get 'signup',to:'users#new'
    resources :users,except:[:new]
  resources :articles
end
