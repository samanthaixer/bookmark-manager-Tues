
require 'pg'
class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "SELECT * FROM bookmarks"

    results.map { |bookmark| bookmark['url'] }
  end

  def self.create(url)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "INSERT INTO bookmarks (url) VALUES ('#{url}')"
    results.result_status
  end
end
