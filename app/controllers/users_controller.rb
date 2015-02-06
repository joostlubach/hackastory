class UsersController < ApplicationController

  def index
    @users = User.ordered
  end

end