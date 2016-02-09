Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :drinks do
    collection do
      post 'search'
    end
  end

end
