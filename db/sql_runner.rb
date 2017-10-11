require('pg')

class SqlRunner
  def self.run(sql, runner)
    begin
      db = PG.connect({
        dbname: 'music',
        host: 'localhost'
        })
          db.prepare("query", sql)
          result = db.exec_prepared("qurey", values)
        ensure
          db.close
        end
        return result
  end
end
