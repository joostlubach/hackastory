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

    notification = {
      :type   => :unlock,
      :user   => {
        :id     => current_user.id,
        :name   => current_user.name,
        :avatar => "/assets/users/#{current_user.name.downcase.dasherize}.jpg"
      },
      :story  => {
        :id     => @aspect.story.id
      }
    }

    if @aspect.is_a?(TextAspect)
      notification[:aspect] = {
        :aspect => @aspect.aspect,
        :text   => @aspect.text
      }
    end
    if @aspect.is_a?(ImageAspect)
      notification[:aspect] = {
        :aspect    => @aspect.aspect,
        :image_url => @aspect.image_url
      }
    end

    send_notification notification
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