Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  resources :tweets do
  	resources :likes, only: [] do
      post :toggle, on: :collection
    end
    resources :comments
  end
end
