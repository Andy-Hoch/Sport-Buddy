require "open-uri"

puts "Cleaning up users database..."
User.destroy_all
puts "User database cleaned"

andreas = User.new(
  first_name: 'Andreas',
  last_name: 'Hoch',
  sex: 'male',
  address: 'Schaafenstraße 7, 50676 Köln',
  birth_date: Date.parse('12-12-1993'),
  phone_number: '+49 173 123456',
  email: 'andreas@hoch.de',
  password: 'andreas',
  password_confirmation: 'andreas'
)
file = URI.open("https://media.licdn.com/dms/image/C4D03AQG0MGuYWqBpKA/profile-displayphoto-shrink_400_400/0/1611306545766?e=1698278400&v=beta&t=VTRkWs2DHdW-7ATAU8VcqnVeZ57nB0LtaXsUcmAnY3A")
andreas.photo.attach(io: file, filename: "andreas.png", content_type: "image/png")
andreas.save!
puts andreas.first_name

nicole = User.new(
  first_name: 'Nicole',
  last_name: 'Deutrich',
  sex: 'female',
  address: 'Maastrichterstraße 21, 50676 Köln',
  birth_date: Date.parse('23-09-1991'),
  phone_number: '+49 171 123456',
  email: 'nicole@deutrich.de',
  password: 'nicole',
  password_confirmation: 'nicole'
)
file = URI.open("https://media.licdn.com/dms/image/D4E03AQH4yorsJofpTA/profile-displayphoto-shrink_400_400/0/1687275644277?e=1698278400&v=beta&t=6VTVjJuaD2V6xF9Izd4cIIUGOAmlSw9WTW1-Q8QZ-YA")
nicole.photo.attach(io: file, filename: "nicole.png", content_type: "image/png")
nicole.save!
puts nicole.first_name

isabel = User.new(
  first_name: 'Isabel',
  last_name: 'Schmidt',
  sex: 'female',
  address: 'Maastrichterstraße 4, 50676 Köln',
  birth_date: Date.parse('14-05-1978'),
  phone_number: '+49 172 123456',
  email: 'isabel@schmidt.de',
  password: 'isabel',
  password_confirmation: 'isabel'
)
file = URI.open("https://img.freepik.com/fotos-kostenlos/attraktive-selbstbewusste-reife-blonde-frau-die-gelbes-kleid-traegt-das-arme-auf-brust-kreuzt-und-gluecklich-in-die-kamera-laechelt-und-in-ihrer-neu-renovierten-wohnung-mit-sofa-und-fenstern-im-hintergrund-aufwirft_343059-2235.jpg?size=626&ext=jpg&uid=R111922769&ga=GA1.2.1135167755.1691244678&semt=ais")
isabel.photo.attach(io: file, filename: "isabel.png", content_type: "image/png")
isabel.save!
puts isabel.first_name

heiko = User.new(
  first_name: 'Heiko',
  last_name: 'Müller',
  sex: 'male',
  address: 'Lützowstraße 38, 50674 Köln',
  birth_date: Date.parse('05-02-1984'),
  phone_number: '+49 170 123456',
  email: 'heiko@mueller.de',
  password: 'heiko1',
  password_confirmation: 'heiko1'
)
file = URI.open("https://img.freepik.com/fotos-kostenlos/das-portraet-eines-gutaussehenden-baertigen-europaeischen-mannes-mit-grauem-haar-und-bartlaecheln-sieht-angenehm-direkt-nach-vorne-aus-wenn-es-gut-gelaunt-ist-traegt-der-glueckliche-tag-eine-brille-und-einen-pullover-die-ueber-der-blauen-wand-isoliert-sind_273609-44285.jpg?size=626&ext=jpg&uid=R111922769&ga=GA1.2.1135167755.1691244678&semt=ais")
heiko.photo.attach(io: file, filename: "heiko.png", content_type: "image/png")
heiko.save!
puts heiko.valid?

puts "Cleaning up sport categories database..."
Sport_category.destroy_all
puts "Sport categories database cleaned"

tennis = Sport_category.new(
  name: 'Tennis',
  emoji: '🎾'
)

file = URI.open("https://images.unsplash.com/photo-1530915365347-e35b749a0381")
tennis.photo.attach(io: file, filename: "tennis.png", content_type: "image/png")
tennis.save!

table_tennis = Sport_category.new(
  name: 'Table tennis',
  emoji: '🏓'
)

file = URI.open("https://images.unsplash.com/photo-1611251135345-18c56206b863")
table_tennis.photo.attach(io: file, filename: "table_tennis.png", content_type: "image/png")
table_tennis.save!

squash = Sport_category.new(
  name: 'Squash',
  emoji: '🎾'
)

file = URI.open("https://images.unsplash.com/photo-1554290813-ec6a2a72e5c7")
squash.photo.attach(io: file, filename: "squash.png", content_type: "image/png")
squash.save!

badminton = Sport_category.new(
  name: 'Badminton',
  emoji: '🏸'
)

file = URI.open("https://images.unsplash.com/photo-1613918431703-aa50889e3be9")
badminton.photo.attach(io: file, filename: "badminton.png", content_type: "image/png")
badminton.save!

judo = Sport_category.new(
  name: 'Judo',
  emoji: '🥋'
)

file = URI.open("https://images.unsplash.com/photo-1603210185603-57fc717c4456")
judo.photo.attach(io: file, filename: "judo.png", content_type: "image/png")
judo.save!

bjj = Sport_category.new(
  name: 'Brazilian Jiu Jitsu',
  emoji: '🥋'
)

file = URI.open("https://images.unsplash.com/photo-1585537884613-1a9bcd024983")
bjj.photo.attach(io: file, filename: "bjj.png", content_type: "image/png")
bjj.save!

tkd = Sport_category.new(
  name: 'Tae Kwon Do',
  emoji: '🥋'
)

file = URI.open("https://images.unsplash.com/photo-1560631820-07993da0af22")
tkd.photo.attach(io: file, filename: "tkd.png", content_type: "image/png")
tkd.save!

fencing = Sport_category.new(
  name: 'Fencing',
  emoji: '🤺'
)

file = URI.open("https://images.unsplash.com/photo-1636812028922-023445fbab51")
fencing.photo.attach(io: file, filename: "fencing.png", content_type: "image/png")
fencing.save!

football = Sport_category.new(
  name: 'Football',
  emoji: '⚽'
)

file = URI.open("https://images.unsplash.com/photo-1606925797300-0b35e9d1794e")
football.photo.attach(io: file, filename: "football.png", content_type: "image/png")
football.save!

basketball = Sport_category.new(
  name: 'Basketball',
  emoji: '🏀'
)

file = URI.open("https://images.unsplash.com/photo-1627627256672-027a4613d028")
basketball.photo.attach(io: file, filename: "basketball.png", content_type: "image/png")
basketball.save!

volleyball = Sport_category.new(
  name: 'Volleyball',
  emoji: '🏐'
)

file = URI.open("https://images.unsplash.com/photo-1612872087720-bb876e2e67d1")
volleyball.photo.attach(io: file, filename: "volleyball.png", content_type: "image/png")
volleyball.save!

rugby = Sport_category.new(
  name: 'Rugby',
  emoji: '🏉'
)

file = URI.open("https://images.unsplash.com/photo-1480099225005-2513c8947aec")
rugby.photo.attach(io: file, filename: "rugby.png", content_type: "image/png")
rugby.save!

baseball = Sport_category.new(
  name: 'Baseball',
  emoji: '⚾'
)

file = URI.open("https://images.unsplash.com/photo-1508344928928-7165b67de128")
baseball.photo.attach(io: file, filename: "baseball.png", content_type: "image/png")
baseball.save!

cricket = Sport_category.new(
  name: 'Cricket',
  emoji: '🏏'
)

file = URI.open("https://images.unsplash.com/photo-1624526267942-ab0ff8a3e972")
cricket.photo.attach(io: file, filename: "cricket.png", content_type: "image/png")
cricket.save!

ballroom = Sport_category.new(
  name: 'Ballroom dancing',
  emoji: '💃'
)

file = URI.open("https://images.unsplash.com/photo-1566902249079-c97d67671278")
ballroom.photo.attach(io: file, filename: "ballroom.png", content_type: "image/png")
ballroom.save!

tango = Sport_category.new(
  name: 'Tango dancing',
  emoji: '💃'
)

file = URI.open("https://images.unsplash.com/photo-1575448913281-98e9e5d3f193")
tango.photo.attach(io: file, filename: "tango.png", content_type: "image/png")
tango.save!

salsa = Sport_category.new(
  name: 'Salsa dancing',
  emoji: '💃'
)

file = URI.open("https://images.unsplash.com/photo-1545959570-a94084071b5d")
salsa.photo.attach(io: file, filename: "salsa.png", content_type: "image/png")
salsa.save!

swing = Sport_category.new(
  name: 'Swing dancing',
  emoji: '🎺'
)

file = URI.open("https://images.unsplash.com/photo-1504609813442-a8924e83f76e")
swing.photo.attach(io: file, filename: "swing.png", content_type: "image/png")
swing.save!

running = Sport_category.new(
  name: 'Running',
  emoji: '🏃‍♀️'
)

file = URI.open("https://images.unsplash.com/photo-1552674605-db6ffd4facb5")
running.photo.attach(io: file, filename: "running.png", content_type: "image/png")
running.save!

swimming = Sport_category.new(
  name: 'Swimming',
  emoji: '🏊‍♂️'
)

file = URI.open("https://images.unsplash.com/photo-1438029071396-1e831a7fa6d8")
swimming.photo.attach(io: file, filename: "swimming.png", content_type: "image/png")
swimming.save!

puts "Categories created"

puts "Cleaning up sport sessions database..."
Sport_session.destroy_all
puts "Sport sessions database cleaned"

takedown = Sport_session.new(
  title: 'BJJ takedowns practice',
  description: 'Looking to work on upper body grip takedowns',
  address: 'Stolberger Str. 370, 50933 Köln',
  start_time: DateTime.parse('2023-09-30, 10:30'),
  end_time: DateTime.parse('2023-09-30, 12:30'),
  skill_level: 'Intermediate',
  max_attendees: '2',
  price: '10'
)

serve = Sport_session.new(
  title: 'Tennis serve returns',
  description: 'Hoping to practice serve returns',
  address: 'Poller Weg 1, 51149 Köln',
  start_time: DateTime.parse('2023-09-12, 14:00'),
  end_time: DateTime.parse('2023-09-12, 16:00'),
  skill_level: 'Intermediate',
  max_attendees: '2',
  price: '20'
)

knockabout = Sport_session.new(
  title: 'Knockabout tennis game',
  description: 'Looking for a regular tennis partner for fun/ semi-competitive games',
  address: 'Poller Weg 1, 51149 Köln',
  start_time: DateTime.parse('2023-09-15, 15:00'),
  end_time: DateTime.parse('2023-09-15, 17:00'),
  skill_level: 'Intermediate',
  max_attendees: '2',
  price: '20'
)

doubles = Sport_session.new(
  title: 'Mixed doubles tennis game',
  description: 'Any mixed doubles partners looking for a game? We are decent club-level players looking for new pairs to play against.',
  address: 'Poller Weg 1, 51149 Köln',
  start_time: DateTime.parse('2023-09-20, 15:00'),
  end_time: DateTime.parse('2023-09-20, 17:00'),
  skill_level: 'Intermediate',
  max_attendees: '4',
  price: '20'
)

swing = Sport_session.new(
  title: 'Swing dance practice',
  description: 'I am looking for a partner to practice basic swing dance moves',
  address: 'Neue Weyerstraße 5, 50676 Köln',
  start_time: DateTime.parse('2023-09-30, 10:30'),
  end_time: DateTime.parse('2023-08-30, 12:30'),
  skill_level: 'Beginner',
  max_attendees: '2',
  price: '15'
)

pickup = Sport_session.new(
  title: 'Pickup basketball in the park',
  description: 'Anyone interested in a 2-2 pickup basketball game in the park? ',
  address: 'Deutzer Werft, 50679 Köln',
  start_time: DateTime.parse('2023-09-10, 15:30'),
  end_time: DateTime.parse('2023-09-10, 17:00'),
  skill_level: 'Intermediate',
  max_attendees: '4',
  price: '0'
)

leglocks = Sport_session.new(
  title: 'BJJ leglocks escape practice',
  description: 'Looking to practice escapes from leglocks',
  address: 'Stolberger Str. 370, 50933 Köln',
  start_time: DateTime.parse('2023-09-16, 07:30'),
  end_time: DateTime.parse('2023-09-16, 08:30'),
  skill_level: 'Intermediate',
  max_attendees: '2',
  price: '10'
)

ballroom = Sport_session.new(
  title: 'Ballroom dance practice',
  description: 'I am looking for an experienced partner to practice advanced/ competition-level moves',
  address: 'Neue Weyerstraße 5, 50676 Köln',
  start_time: DateTime.parse('2023-09-30, 10:30'),
  end_time: DateTime.parse('2023-08-30, 12:30'),
  skill_level: 'Advanced',
  max_attendees: '2',
  price: '15'
)
