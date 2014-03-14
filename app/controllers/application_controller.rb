class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_admin!
    if fan_signed_in?
      if (current_fan.uid == 1517040135)
        true
      end
    end
  end
end
