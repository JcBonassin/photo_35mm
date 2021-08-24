Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
 # , path: '',
 # path_names: {
 #     sign_in: 'Login',
 #     sign_out: 'Logout',
 #     sign_up: 'register'
 # } 

  


  root to: "home#index"

  resources :users, :only => [:show, :update, :new] do
    get 'upload' => 'users#upload_avatar'
    resources :photos, :except => [:edit, :update, :new]
  end

  resources :photos, :except => [:create]
  delete 'photos/:id/delete' => 'photos#destroy', as: 'photos_delete'
  get '/photos/:id/delete' => 'photos#destroy'
  
end
