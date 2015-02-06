class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def unlock
    @story = Story.find(params[:id])
    @aspect = @story.unlock(params[:aspect], current_user)
  end

end