require('pg')
require_relative('../db/sql_runner.rb')
require_relative('albums.rb')

class Artists

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def insert
    db = PG.connect({
      dbname: 'music',
      host: 'localhost'
      })
    sql = " INSERT INTO artists (name) VALUES ($1) RETURNING * "

    values = [@name]
    db.prepare("save", sql)

    @id = db.exec_prepared("save", values)[0]['id'].to_i()
    db.close
  end

  def self.all
    sql = "SELECT * FROM  artists"
    values = []
    artists = SqlRunner.run(sql, values)
    artists_as_objects = artists.map{|artist| Artists.new(artist)}
    return artists_as_objects
  end

end
