Rails.application.routes.draw do

  
  
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }, path: '',
  path_names: {
      sign_in: 'Login',
      sign_out: 'Logout',
      sign_up: 'register'
  } 

  root to: "home#index"

  resources :users, :only => [:show, :update, :new] do
    get 'upload' => 'users#upload_avatar'
    resources :photos, :except => [:edit, :update, :new]
  end

  resources :photos, :except => [:create] do
    delete 'photos/:id/delete' => 'photos#destroy', as: 'photos_delete'
    get '/photos/:id/delete' => 'photos#destroy'
    resources :comments, only: [:create, :destroy] #, :only => [:create, :destroy, :new]
    delete ':comments/:id/delete' => 'comments#destroy'
    get '/:comments/:id/delete' => 'comments#destroy'
    resources :labels,  only: [:new, :create, :destroy,]
  end

     resources :labels,  only: [:index, :show]
  
end
