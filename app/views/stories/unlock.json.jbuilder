json.aspect do
  json.partial! 'stories/aspect', aspect: @aspect
end

json.story do
  json.unlocked @aspect.story.unlocked
  json.popular_on_nos @aspect.story.popular_on_nos
end