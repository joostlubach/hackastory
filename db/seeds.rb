# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

elger = User.new(name: 'Elger', password: 'strikje')
joost = User.new(name: 'Joost', password: 'gay')

story = Story.new
story.aspects << TextAspect.new(aspect: :what, text: 'Huge party', order: 1)
story.aspects << TextAspect.new(aspect: :who, text: 'At a hackathon', order: 2, unlocker: elger)
story.aspects << TextAspect.new(aspect: :where, text: 'Amsterdam', order: 3, unlocker: joost)
story.aspects << TextAspect.new(aspect: :when, text: 'Friday, February 6th')
story.aspects << TextAspect.new(aspect: :why, text: 'Because everyone felt like it')
story.save!