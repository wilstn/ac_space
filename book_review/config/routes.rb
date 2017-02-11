Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'book#index'

  resources :book do
    resources :review
    collection do
      get 'search'
      post 'search'
    end
  end
  
end
