json.users @users do |user|
  json.(user, :id, :name)
  json.avatar image_url("users/#{user.name.downcase.parameterize}.jpg")
end