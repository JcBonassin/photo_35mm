Rails.application.routes.draw do

  devise_for :users, path: '',
  path_names: {
      sign_in: 'Login',
      sign_out: 'Logout',
      sign_up: 'register'
  }

  root to: "home#index"

  resources :users, :only => [:show, :update] do
    get 'upload' => 'users#upload_avatar'
    resources :photos, :except => [:edit, :update]
  end

  resources :photos, :except => [:new, :create]
  
end
