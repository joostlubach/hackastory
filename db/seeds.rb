require 'net/http'

andre = User.create(name: 'Andre')
bart = User.create(name: 'Bart')
dries = User.create(name: 'Dries')
elger = User.create(name: 'Elger')
emiel = User.create(name: 'Emiel')
frans = User.create(name: 'Frans')
gemma = User.create(name: 'Gemma')
gregg = User.create(name: 'Gregg')
hay = User.create(name: 'Hay')
heinze = User.create(name: 'Heinze')
herve = User.create(name: 'Herve')
inge = User.create(name: 'Inge')
jeroen = User.create(name: 'Jeroen')
joel = User.create(name: 'Joel')
joost = User.create(name: 'Joost')
lotte = User.create(name: 'Lotte')
marcel = User.create(name: 'Marcel')
martijn = User.create(name: 'Martijn')
mireille = User.create(name: 'Mireille')
niall = User.create(name: 'Niall')
nienke = User.create(name: 'Nienke')
sebastiaan = User.create(name: 'Sebastiaan')
tim = User.create(name: 'Tim')
beaker = User.create(name: 'Beaker')
chef = User.create(name: 'Chef')
fozzie = User.create(name: 'Fozzie')
gonzo = User.create(name: 'Gonzo')
pepe = User.create(name: 'Pepe')
bigbird = User.create(name: 'Bigbird')
kermit = User.create(name: 'Kermit')
miss_piggy = User.create(name: 'Miss Piggy')

data = SmarterCSV.process(Rails.root + 'db/seeds/stories.csv')
data.each do |row|
  story = Story.create_from_aspects!(row)

  story.title = row[:title]
  story.content = row[:story]
  story.image_url = row[:picture]
  story.happened_on = row[:date]
  story.popular_on_nos = row[:populair]
  story.save!
end