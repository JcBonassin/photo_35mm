Rails.application.routes.draw do
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, :only => [:show, :update] do
    get 'upload' => 'users#upload_avatar'
    resources :photos, :except => [:edit, :update]
  end
  
end
