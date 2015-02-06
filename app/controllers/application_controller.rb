class ApplicationController < ActionController::Base

  class NotLoggedIn < RuntimeError
  end

  rescue_from NotLoggedIn, with: :render_unauthorized
  rescue_from RuntimeError, with: :render_exception

  def current_user
    if cookies[:current_user_id]
      User.find cookies[:current_user_id]
    else
      User.find_by_name('Joost')
    end
  end
  helper_method :current_user

  protected

  def render_unauthorized
    render json: {:error => 'not logged in'}, status: :unauthorized
  end

  def render_exception(ex)
    render json: {:error => ex.message}, status: :unauthorized
  end

end
