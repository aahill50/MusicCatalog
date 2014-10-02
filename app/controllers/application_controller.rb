class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @cu ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def log_in!(user)
    user.reset_session_token!
    user.save!
    session[:session_token] = user.session_token
  end

  def log_out!(user)
    session[:session_token] = nil
  end

  helper_method(:current_user)
  helper_method(:logged_in?)
  helper_method(:log_in)
  helper_method(:log_out)
end
