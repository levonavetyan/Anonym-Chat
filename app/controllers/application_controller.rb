class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_user

  private

  def set_user
    if current_user
      cookies[:username] = current_user.id
    end
  end
end
