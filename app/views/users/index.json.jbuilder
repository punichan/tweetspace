json.array! @userss do |user|
  json.id          user.id
  json.avater      user.avater
  json.name        user.name
  json.profile     user.profile
end
