class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_activities

  before_filter :authenticate_user

  def current_user
    @current_user ||= session_user
  end

  def current_activities
    @current_activities ||= current_user.activities
  end

  protected
  def authenticate_user
    redirect_to new_session_path if session[:user_id].blank?
  end

  def clear_session
    session[:user_id] = nil
    session[:token] = nil
  end

  private
  def session_user
    session[:user_id] && User.find_by(id: session[:user_id])
  end
end
