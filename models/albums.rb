require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Albums

  attr_reader :id, :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def insert
    sql = "
    INSERT INTO music ( name, genre, artist_id)
    VALUES ( 1$, 2$, 3$)
    RETURNING *
    "
    values = [@name, @genre, @artist_id]
    saved_albums = SqlRunner.run(sql, values)
    @id = saved_orders[0]['id'].to_i
  end



end
