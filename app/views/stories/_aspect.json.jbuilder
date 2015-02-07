json.(aspect, :aspect, :badge)

if aspect.respond_to?(:text)
  json.text aspect.text
elsif aspect.respond_to?(:image_url)
  json.image_url aspect.image_url
end

if aspect.unlocker
  json.unlocked_by_me (aspect.unlocker == current_user)

  json.unlocker do
    json.(aspect.unlocker, :id, :name)
    json.avatar image_url("users/#{aspect.unlocker.name.downcase.dasherize}.jpg")
  end
end
