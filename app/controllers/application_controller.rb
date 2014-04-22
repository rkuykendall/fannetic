class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_admin!
    if not current_fan.try(:is_admin?)
      flash[:alert] = "We are always striving for things forbidden, and coveting those denied us."
      redirect_to '/'
    end
  end
  
  def authenticate!
    if not fan_signed_in?
      flash[:notice] = "Please sign in using Facebook."
      redirect_to :back
    end
  end
end
