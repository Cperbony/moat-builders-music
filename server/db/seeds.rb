require 'csv'

unless User.any?
  User.create(
    username: 'Moat Builder',
    email: 'guest@moat_builders.com',
    first_name: 'Claus',
    password: 'password',
    image_url: Faker::Avatar.image,
    session_token: SecureRandom.urlsafe_base64(128),
  )
end

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}_#{last_name}@#{%w[gmail yahoo hotmail].sample}.com"
  username = first_name.to_s.concat(" #{last_name}")

  User.create!(
    username: username,
    email: email,
    first_name: first_name,
    last_name: last_name,
    password: 'password',
    image_url: Faker::Avatar.image,
    session_token: SecureRandom.urlsafe_base64(128),
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

unless Album.any?
  albums = CSV.read('db/seeds/album-seed.csv')
  albums.shift

  albums.each do |album|
    title = album[1]
    artist_name = album[2]
    image_url = album[3]

    artist = Artist.find_by(name: artist_name)
    Album.create!(
      title: title,
      artist_id: artist.id,
      image_url: image_url,
    )
  end
end

unless Song.any?
  songs = CSV.read('db/seeds/song-seed.csv')
  songs.shift

  songs.each do |song|
    title = song[1]
    album_id = song[2]
    order = song[3]
    song_url = song[4]

    Song.create!(
      title: title,
      album_id: album_id,
      order: order,
      song_url: song_url,
    )
  end
end

unless Playlist.any?
  first = %w[My This Sweet The Greatest]
  second = %w[Awesome Rocking Hype Music Sound Track]
  third = %w[Playlist Album Songs]

  5.times do
    Playlist.create!(
      title: "#{first.sample} #{second.sample} #{third.sample}",
      user_id: 1,
      image_url: 'http://res.cloudinary.com/davidhu2000/image/upload/c_crop,h_1000,w_1000/v1484942922/636097581326278234875680958_Gym_20Playlist_j21re9.jpg',
    )
  end

  25.times do
    Playlist.create!(
      title: "#{first.sample} #{second.sample} #{third.sample}",
      user_id: rand(21),
    )
  end

  song_index = (1..100).to_a

  30.times do |i|
    num_song = rand(1..10)
    pl_song = song_index.sample(num_song)

    pl_song.each do |idx|
      PlaylistSong.create!(
        playlist_id: i + 1,
        song_id: idx,
      )
    end
  end

  user_idx = (1..20).to_a

  30.times do |i|
    num_user = rand(1..5)
    pl_users = user_idx.sample(num_user)

    pl_users.each do |idx|
      PlaylistFollow.create!(
        playlist_id: i + 1,
        user_id: idx,
      )
    end
  end
end
