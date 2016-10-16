require('pg')

class SqlRunner

  def self.run(sql)
    db = PG.connect( {dbname: 'film_house', host: 'localhost'} )
    result = db.exec(sql)
    db.close()
    return result
  end

end