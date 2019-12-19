json.array! @tweetss do |tweet|
  json.id          tweet.id
  json.tweet       tweet.tweet
  json.image       tweet.image
  json.created_at  tweet.created_at.strftime("%Y-%m-%d %H:%M")
  json.user_id     tweet.user_id
  json.user_avater tweet.user.avater
  json.user_name   tweet.user.name
  json.likes       tweet.likes
  json.comments    tweet.comments
end