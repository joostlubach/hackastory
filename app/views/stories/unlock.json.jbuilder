json.aspect do
  json.partial! 'stories/aspect', aspect: @aspect
end

json.story do
  json.unlocked @aspect.story.unlocked
end