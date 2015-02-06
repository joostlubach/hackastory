class ApplicationController < ActionController::Base

  class NotLoggedIn < RuntimeError
  end

  rescue_from NotLoggedIn, with: :render_unauthorized
  rescue_from RuntimeError, with: :render_exception

  def current_user
    if cookies[:current_user_id]
      User.find cookies[:current_user_id]
    else
      raise NotLoggedIn
    end
  end

  protected

  def render_unauthorized
    render json: {:error => 'not logged in'}, status: :unauthorized
  end

  def render_exception(ex)
    render json: {:error => ex.message}, status: :unauthorized
  end

end
