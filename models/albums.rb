require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Albums

  attr_reader :id, :title, :genre,

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i


  end

end
