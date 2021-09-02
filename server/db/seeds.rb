require 'csv'

unless User.any?
  User.create(
    username: 'Moat Builder',
    email: 'guest@moat_builders.com',
    first_name: 'Claus',
    password: 'password',
    image_url: Faker::Avatar.image,
  )
end

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}_#{last_name}@#{%w[gmail yahoo hotmail].sample}.com"
  username = "#{first_name}+#{last_name}"

  User.create!(
    username: username,
    email: email,
    first_name: first_name,
    last_name: last_name,
    password: 'password',
    image_url: Faker::Avatar.image,
  )
end

unless Artist.any?
  artists = CSV.read('db/seeds/artist-seed.csv')
  artists.shift

  artists.each do |artist|
    name = artist[0]
    image_url = artist[1]

    Artist.create!(
      name: name,
      image_url: image_url,
    )
  end
end
