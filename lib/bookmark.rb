
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

    results = connection.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') returning id, url, title;"
    Bookmark.new(results[0]['id'], results[0]['url'], results[0]['title'])
  end

  def self.delete(id)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "DELETE FROM bookmarks WHERE id = '#{id}';"
    results.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.one(id)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "SELECT * FROM bookmarks WHERE id = #{id};"
    Bookmark.new(results[0]['id'], results[0]['url'], results[0]['title'])
  end

  def self.update(bookmark)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test'
    else
      connection = PG.connect :dbname => 'bookmark_manager'
    end

    results = connection.exec "UPDATE BOOKMARKS SET url = '#{bookmark.url}', title = '#{bookmark.title}' WHERE id = #{bookmark.id} RETURNING id, url, title;"
    Bookmark.new(results[0]['id'], results[0]['url'], results[0]['title'])
  end
end
