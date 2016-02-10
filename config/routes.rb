Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :drinks do
    collection do
      post 'search'
      get  'show'
      post 'show'
    end
  end

end
