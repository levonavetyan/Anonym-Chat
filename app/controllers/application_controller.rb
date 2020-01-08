class ApplicationController < ActionController::Base
    before_action :configure_permited_parameters, if: :devise_controller?
    before_action :authenticate_user!
end