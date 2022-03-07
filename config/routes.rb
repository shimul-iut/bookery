Rails.application.routes.draw do
  resources :genres do
    resources :book_lists
  end
  resources :users do
    resources :book_owners
  end
  resources :book_owners do
    resources :book_lists
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
