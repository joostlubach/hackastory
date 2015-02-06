class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def unlock
    @story = Story.find(params[:id])

    if @story.unlocked_by(current_user)
      raise BadRequest, "story already unlocked"
    else
      @aspect = @story.unlock(params[:aspect], current_user)
    end
  end

end