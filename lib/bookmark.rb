
require 'pg'
class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "SELECT * FROM bookmarks;"
    results.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');"
    results.result_status
  end

  def self.delete(id)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "DELETE FROM bookmarks WHERE id = #{id};"
    results.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end
end
