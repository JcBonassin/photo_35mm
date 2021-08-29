class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
    end
    #def configure_permitted_parameters
    #  
    #  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    #    user_params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    #  end
    #  devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    #    user_params.permit(:email, :password)
    #  end
    #  devise_parameter_sanitizer.permit(:account_update) do |user_params|
    #    user_params.permit(:email, :current_password, :password, :password_confirmation)
    #  end
    #end 

 # layout :layout_by_resource
#
 # private
#
 # def layout_by_resource
 #   if devise_controller? && resource_name == :user && action_name == "new"
 #     "devise"
 #   else
 #     "application"
 #   end
 # end

end
