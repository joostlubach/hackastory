json.stories @stories do |story|

  json.id story.id

  json.unlocked_aspects story.aspects.unlocked do |aspect|
    json.(aspect, :aspect, :text)
  end

  json.unlockers story.unlockers do |unlocker|
    json.(unlocker, :id, :name)
    json.avatar image_url("users/#{unlocker.name.downcase.dasherize}.jpg")
  end

end