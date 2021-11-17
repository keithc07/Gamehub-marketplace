class ApplicationController < ActionController::Base
    # Pundit which shows error message or rescues unauthorized action in MVC model
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      flash[:alert] = "This is not your listing. You are not authorized to perform edit/delete."
      redirect_to root_path
    end

    # Devise which permits strong parameters in MVC model
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :unit_address, :suburb, :postal_code, :state_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :unit_address, :suburb, :postal_code, :state_id])
    end

end
