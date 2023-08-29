


puts "Cleaning up sport categories database..."
Sport_category.destroy_all
puts "Sport categories database cleaned"

tennis = Sport_category.new(
  name: 'Tennis',
  img_url: 'xxx',
)

table_tennis = Sport_category.new(
  name: 'Table tennis',
  img_url: 'xxx',
)

squash = Sport_category.new(
  name: 'Squash',
  img_url: 'xxx',
)

badminton = Sport_category.new(
  name: 'Badminton',
  img_url: 'xxx',
)

judo = Sport_category.new(
  name: 'Judo',
  img_url: 'xxx',
)

bjj = Sport_category.new(
  name: 'Brazilian Jiu Jitsu',
  img_url: 'xxx',
)

tkd = Sport_category.new(
  name: 'Tae Kwon Do',
  img_url: 'xxx',
)

fencing = Sport_category.new(
  name: 'Fencing',
  img_url: 'xxx',
)

football = Sport_category.new(
  name: 'Football',
  img_url: 'xxx',
)

basketball = Sport_category.new(
  name: 'Basketball',
  img_url: 'xxx',
)

volleyball = Sport_category.new(
  name: 'Volleyball',
  img_url: 'xxx',
)

rugby = Sport_category.new(
  name: 'Rugby',
  img_url: 'xxx',
)

baseball = Sport_category.new(
  name: 'Baseball',
  img_url: 'xxx',
)

cricket = Sport_category.new(
  name: 'Cricket',
  img_url: 'xxx',
)

ballroom = Sport_category.new(
  name: 'Ballroom dancing',
  img_url: 'xxx',
)

tango = Sport_category.new(
  name: 'Tango dancing',
  img_url: 'xxx',
)

salsa = Sport_category.new(
  name: 'Salsa dancing',
  img_url: 'xxx',
)

swing = Sport_category.new(
  name: 'Swing dancing',
  img_url: 'xxx',
)

running = Sport_category.new(
  name: 'Running',
  img_url: 'xxx',
)

swimming = Sport_category.new(
  name: 'Swimming',
  img_url: 'xxx',
)
