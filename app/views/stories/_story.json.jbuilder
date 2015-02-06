json.id story.id

json.unlocked_by_me story.unlocked_by(current_user)

json.unlocked_aspects story.aspects.unlocked do |aspect|
  json.partial! 'stories/aspect', aspect: aspect
end

json.locked_aspects story.aspects.locked do |aspect|
  json.(aspect, :aspect)
end
