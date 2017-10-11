require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artists.rb')

class Albums

  attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end


  def insert
    sql = "
    INSERT INTO albums ( title, genre, artist_id)
    VALUES ( $1, $2, $3)
    RETURNING *
    "
    values = [@title, @genre, @artist_id]
    saved_albums = SqlRunner.run(sql, values)
    @id = saved_orders[0]['id'].to_i
  end


  def self.all
    sql = "SELECT * FROM albums"
    values = []
    album = SqlRunner.run(sql, values)
    albums_as_objects = album.map{|artist| Albums.new(album)}
    return albums_as_objects
  end


  def self.delete_all
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, values)
  end








end
