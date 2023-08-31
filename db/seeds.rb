require "open-uri"
require "yaml"

puts "Cleaning up users database..."
User.destroy_all
users_path = File.join(__dir__, "data/users.yml")
users = YAML.load_file(users_path)
users.each_with_index do |user, i|
  puts "Creating user #{user[:first_name]}..."
  new_user = User.new(
    {
      first_name: user[:first_name],
      last_name: user[:last_name],
      sex: user[:sex],
      address: user[:address],
      birth_date: Date.parse(user[:birth_date]),
      phone_number: "+49 17#{i} 123456",
      email: "#{user[:first_name]}@#{user[:last_name]}.de",
      password: '123456'
    }
  )
  file = URI.open(user[:avatar])
  new_user.photo.attach(io: file, filename: "#{user[:first_name]}.png", content_type: "image/png")
  new_user.save!
end

puts "User database cleaned"

puts "Cleaning up sport categories database..."

SportCategory.destroy_all

sport_categories_path = File.join(__dir__, "data/sport_categories.yml")
sport_categories = YAML.load_file(sport_categories_path)
sport_categories.each do |sport_category|
  puts "Creating sport category #{sport_category[:name]}..."
  new_sport_category = SportCategory.new(
    {
      name: sport_category[:name],
      emoji: sport_category[:emoji]
    }
  )
  file = URI.open(sport_category[:card_image])
  new_sport_category.photo.attach(io: file, filename: "#{sport_category[:card_image]}.png", content_type: "image/png")
  new_sport_category.save!
end

puts "Sport category database cleaned"

puts "Cleaning up sport sessions database..."
SportSession.destroy_all
sport_sessions_path = File.join(__dir__, "data/sport_sessions.yml")
sport_sessions = YAML.load_file(sport_sessions_path)
sport_sessions.each do |sport_session|
  puts "Creating sport session #{sport_session[:title]}..."
  new_sport_session = SportSession.new(
    {
      title: sport_session[:title],
      description: sport_session[:description],
      start_time: Date.parse(sport_session[:start_time]),
      end_time: Date.parse(sport_session[:end_time]),
      skill_level: sport_session[:skill_level],
      max_attendees: sport_session[:max_attendees],
      price: sport_session[:price]
    }
  )
end

puts "Sport session database cleaned"

puts "Cleaning up venues database..."
Venue.destroy_all
venues_path = File.join(__dir__, "data/venues.yml")
venues = YAML.load_file(venues_path)
venues.each do |venue|
  puts "Creating venue #{venue[:name]}..."
  new_venue = Venue.new(
    {
      name: venue[:title],
      address: venue[:address],
      description: venue[:description]
    }
  )
end

puts "Venue database cleaned"

# puts "Sport categories database cleaned"

# tennis = Sport_category.new(
#   name: 'Tennis',
#   emoji: '🎾'
# )

# file = URI.open("https://images.unsplash.com/photo-1530915365347-e35b749a0381")
# tennis.photo.attach(io: file, filename: "tennis.png", content_type: "image/png")
# tennis.save!

# table_tennis = Sport_category.new(
#   name: 'Table tennis',
#   emoji: '🏓'
# )

# file = URI.open("https://images.unsplash.com/photo-1611251135345-18c56206b863")
# table_tennis.photo.attach(io: file, filename: "table_tennis.png", content_type: "image/png")
# table_tennis.save!

# squash = Sport_category.new(
#   name: 'Squash',
#   emoji: '🎾'
# )

# file = URI.open("https://images.unsplash.com/photo-1554290813-ec6a2a72e5c7")
# squash.photo.attach(io: file, filename: "squash.png", content_type: "image/png")
# squash.save!

# badminton = Sport_category.new(
#   name: 'Badminton',
#   emoji: '🏸'
# )

# file = URI.open("https://images.unsplash.com/photo-1613918431703-aa50889e3be9")
# badminton.photo.attach(io: file, filename: "badminton.png", content_type: "image/png")
# badminton.save!

# judo = Sport_category.new(
#   name: 'Judo',
#   emoji: '🥋'
# )

# file = URI.open("https://images.unsplash.com/photo-1603210185603-57fc717c4456")
# judo.photo.attach(io: file, filename: "judo.png", content_type: "image/png")
# judo.save!

# bjj = Sport_category.new(
#   name: 'Brazilian Jiu Jitsu',
#   emoji: '🥋'
# )

# file = URI.open("https://images.unsplash.com/photo-1585537884613-1a9bcd024983")
# bjj.photo.attach(io: file, filename: "bjj.png", content_type: "image/png")
# bjj.save!

# tkd = Sport_category.new(
#   name: 'Tae Kwon Do',
#   emoji: '🥋'
# )

# file = URI.open("https://images.unsplash.com/photo-1560631820-07993da0af22")
# tkd.photo.attach(io: file, filename: "tkd.png", content_type: "image/png")
# tkd.save!

# fencing = Sport_category.new(
#   name: 'Fencing',
#   emoji: '🤺'
# )

# file = URI.open("https://images.unsplash.com/photo-1636812028922-023445fbab51")
# fencing.photo.attach(io: file, filename: "fencing.png", content_type: "image/png")
# fencing.save!

# football = Sport_category.new(
#   name: 'Football',
#   emoji: '⚽'
# )

# file = URI.open("https://images.unsplash.com/photo-1606925797300-0b35e9d1794e")
# football.photo.attach(io: file, filename: "football.png", content_type: "image/png")
# football.save!

# basketball = Sport_category.new(
#   name: 'Basketball',
#   emoji: '🏀'
# )

# file = URI.open("https://images.unsplash.com/photo-1627627256672-027a4613d028")
# basketball.photo.attach(io: file, filename: "basketball.png", content_type: "image/png")
# basketball.save!

# volleyball = Sport_category.new(
#   name: 'Volleyball',
#   emoji: '🏐'
# )

# file = URI.open("https://images.unsplash.com/photo-1612872087720-bb876e2e67d1")
# volleyball.photo.attach(io: file, filename: "volleyball.png", content_type: "image/png")
# volleyball.save!

# rugby = Sport_category.new(
#   name: 'Rugby',
#   emoji: '🏉'
# )

# file = URI.open("https://images.unsplash.com/photo-1480099225005-2513c8947aec")
# rugby.photo.attach(io: file, filename: "rugby.png", content_type: "image/png")
# rugby.save!

# baseball = Sport_category.new(
#   name: 'Baseball',
#   emoji: '⚾'
# )

# file = URI.open("https://images.unsplash.com/photo-1508344928928-7165b67de128")
# baseball.photo.attach(io: file, filename: "baseball.png", content_type: "image/png")
# baseball.save!

# cricket = Sport_category.new(
#   name: 'Cricket',
#   emoji: '🏏'
# )

# file = URI.open("https://images.unsplash.com/photo-1624526267942-ab0ff8a3e972")
# cricket.photo.attach(io: file, filename: "cricket.png", content_type: "image/png")
# cricket.save!

# ballroom = Sport_category.new(
#   name: 'Ballroom dancing',
#   emoji: '💃'
# )

# file = URI.open("https://images.unsplash.com/photo-1566902249079-c97d67671278")
# ballroom.photo.attach(io: file, filename: "ballroom.png", content_type: "image/png")
# ballroom.save!

# tango = Sport_category.new(
#   name: 'Tango dancing',
#   emoji: '💃'
# )

# file = URI.open("https://images.unsplash.com/photo-1575448913281-98e9e5d3f193")
# tango.photo.attach(io: file, filename: "tango.png", content_type: "image/png")
# tango.save!

# salsa = Sport_category.new(
#   name: 'Salsa dancing',
#   emoji: '💃'
# )

# file = URI.open("https://images.unsplash.com/photo-1545959570-a94084071b5d")
# salsa.photo.attach(io: file, filename: "salsa.png", content_type: "image/png")
# salsa.save!

# swing = Sport_category.new(
#   name: 'Swing dancing',
#   emoji: '🎺'
# )

# file = URI.open("https://images.unsplash.com/photo-1504609813442-a8924e83f76e")
# swing.photo.attach(io: file, filename: "swing.png", content_type: "image/png")
# swing.save!

# running = Sport_category.new(
#   name: 'Running',
#   emoji: '🏃‍♀️'
# )

# file = URI.open("https://images.unsplash.com/photo-1552674605-db6ffd4facb5")
# running.photo.attach(io: file, filename: "running.png", content_type: "image/png")
# running.save!

# swimming = Sport_category.new(
#   name: 'Swimming',
#   emoji: '🏊‍♂️'
# )

# file = URI.open("https://images.unsplash.com/photo-1438029071396-1e831a7fa6d8")
# swimming.photo.attach(io: file, filename: "swimming.png", content_type: "image/png")
# swimming.save!

# puts "Categories created"

# puts "Cleaning up sport sessions database..."
# Sport_session.destroy_all
# puts "Sport sessions database cleaned"

# takedown = Sport_session.new(
#   title: 'BJJ takedowns practice',
#   description: 'Looking to work on upper body grip takedowns',
#   address: 'Stolberger Str. 370, 50933 Köln',
#   start_time: DateTime.parse('2023-09-30, 10:30'),
#   end_time: DateTime.parse('2023-09-30, 12:30'),
#   skill_level: 'Intermediate',
#   max_attendees: '2',
#   price: '10'
# )

# serve = Sport_session.new(
#   title: 'Tennis serve returns',
#   description: 'Hoping to practice serve returns',
#   address: 'Poller Weg 1, 51149 Köln',
#   start_time: DateTime.parse('2023-09-12, 14:00'),
#   end_time: DateTime.parse('2023-09-12, 16:00'),
#   skill_level: 'Intermediate',
#   max_attendees: '2',
#   price: '20'
# )

# knockabout = Sport_session.new(
#   title: 'Knockabout tennis game',
#   description: 'Looking for a regular tennis partner for fun/ semi-competitive games',
#   address: 'Poller Weg 1, 51149 Köln',
#   start_time: DateTime.parse('2023-09-15, 15:00'),
#   end_time: DateTime.parse('2023-09-15, 17:00'),
#   skill_level: 'Intermediate',
#   max_attendees: '2',
#   price: '20'
# )

# doubles = Sport_session.new(
#   title: 'Mixed doubles tennis game',
#   description: 'Any mixed doubles partners looking for a game? We are decent club-level players looking for new pairs to play against.',
#   address: 'Poller Weg 1, 51149 Köln',
#   start_time: DateTime.parse('2023-09-20, 15:00'),
#   end_time: DateTime.parse('2023-09-20, 17:00'),
#   skill_level: 'Intermediate',
#   max_attendees: '4',
#   price: '20'
# )

# swing = Sport_session.new(
#   title: 'Swing dance practice',
#   description: 'I am looking for a partner to practice basic swing dance moves',
#   address: 'Neue Weyerstraße 5, 50676 Köln',
#   start_time: DateTime.parse('2023-09-30, 10:30'),
#   end_time: DateTime.parse('2023-08-30, 12:30'),
#   skill_level: 'Beginner',
#   max_attendees: '2',
#   price: '15'
# )

# pickup = Sport_session.new(
#   title: 'Pickup basketball in the park',
#   description: 'Anyone interested in a 2-2 pickup basketball game in the park? ',
#   address: 'Deutzer Werft, 50679 Köln',
#   start_time: DateTime.parse('2023-09-10, 15:30'),
#   end_time: DateTime.parse('2023-09-10, 17:00'),
#   skill_level: 'Intermediate',
#   max_attendees: '4',
#   price: '0'
# )

# leglocks = Sport_session.new(
#   title: 'BJJ leglocks escape practice',
#   description: 'Looking to practice escapes from leglocks',
#   address: 'Stolberger Str. 370, 50933 Köln',
#   start_time: DateTime.parse('2023-09-16, 07:30'),
#   end_time: DateTime.parse('2023-09-16, 08:30'),
#   skill_level: 'Intermediate',
#   max_attendees: '2',
#   price: '10'
# )

# ballroom = Sport_session.new(
#   title: 'Ballroom dance practice',
#   description: 'I am looking for an experienced partner to practice advanced/ competition-level moves',
#   address: 'Neue Weyerstraße 5, 50676 Köln',
#   start_time: DateTime.parse('2023-09-30, 10:30'),
#   end_time: DateTime.parse('2023-08-30, 12:30'),
#   skill_level: 'Advanced',
#   max_attendees: '2',
#   price: '15'
# )
