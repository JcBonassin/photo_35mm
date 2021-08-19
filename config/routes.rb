Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users, path: '',
  path_names: {
      sign_in: 'Login',
      sign_out: 'Logout',
      sign_up: 'register'
  }

  resources :users, :only => [:show, :update] do
    get 'upload' => 'users#upload_avatar'
    resources :photos, :except => [:edit, :update]
  end

  resources :photos, :except => [:new, :create]
  
end
