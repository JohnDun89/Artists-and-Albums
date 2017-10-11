require('pry')
require_relative('models/albums.rb')
require_relative('models/artist')


Artists.delete_all()
Albums.delete_all()

artist_1 = Artists.new({'name' => 'Prince'})
artist_2 = Artists.new({'name' => 'Bruce Springsteen'})

album_1 = Ablums.new({
  'name' => 'Purple Rain'
  'genre' => 'funk'
  'artist_id' => artist_1.id
  })

ablbum_2 = Albums.new({
  'name' => 'Born in the U.S.A.'
  'genre' => 'rock'
  'artist_id' => artist_2.id
  })
  binding.pry
  nil
