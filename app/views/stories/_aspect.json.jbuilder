json.(aspect, :aspect, :text)

if aspect.unlocker
  json.unlocker do
    json.(aspect.unlocker, :id, :name)
    json.avatar image_url("users/#{aspect.unlocker.name.downcase.dasherize}.jpg")
  end
end
