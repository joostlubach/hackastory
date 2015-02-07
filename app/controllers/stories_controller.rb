class StoriesController < ApplicationController

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def unlock
    @story = Story.find(params[:id])

    if @story.unlocked_by?(current_user)
      raise BadRequest, "story already unlocked"
    else
      @aspect = @story.unlock(params[:aspect], current_user)
    end

    send_notification(
      :type   => :unlock,
      :user   => {
        :name => current_user.name,
        :avatar => "/assets/users/#{current_user.name.downcase.dasherize}.jpg"
      },
      :aspect => {
        :aspect => @aspect.aspect,
        :text   => @aspect.text
      }
    )
  end

  def create_badge
    @story = Story.find(params[:id])

    if @story.unlocked_by?(current_user)
      @aspect = @story.aspects.unlocked_by(current_user).first
      @aspect.update_attributes :badge => params[:badge]
    else
      raise BadRequest, "story not unlocked by user"
    end
  end

end