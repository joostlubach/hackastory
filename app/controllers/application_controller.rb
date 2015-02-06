class ApplicationController < ActionController::Base

  def current_user
    User.find_by_name!('Joost')
  end

end
