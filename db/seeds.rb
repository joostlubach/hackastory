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
story.aspects << TextAspect.new(aspect: :what, text: '180 died', order: 1, unlocked_by: elger)
story.aspects << TextAspect.new(aspect: :where, text: 'At a Hackathon', order: 2, unlocked_by: joost)
story.save!