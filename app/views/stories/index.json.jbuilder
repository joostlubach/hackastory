json.stories @stories do |story|

  json.aspects story.aspects.ordered do |aspect|
    json.(aspect, :aspect, :text)
    json.unlocked_by do
      user = aspect.unlocked_by

      json.(user, :id, :name)
      json.avatar image_url("users/#{user.name.downcase.dasherize}.jpg")
    end
  end

end