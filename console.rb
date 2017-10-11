require('pry')
require_relative('models/albums.rb')
require_relative('models/artists.rb')


Artists.delete_all


artist_1 = Artists.new({'name' => 'Kendrick Lamar'})
artist_2 = Artists.new({'name' => 'Bruce Springsteen'})
#
 album_1 = Albums.new({
   'name' => 'Damn',
   'genre' => 'rap',
   'artist_id' => artist_1.id
   })
#
 album_2 = Albums.new({
   'name' => 'Born in the U.S.A.',
   'genre' => 'rock',
   'artist_id' => artist_2.id
   })
  binding.pry
  nil
