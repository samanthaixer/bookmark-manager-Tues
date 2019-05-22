
require 'pg'
class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    results = DatabaseConnection.query "SELECT * FROM bookmarks;"
    results.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title)
    results = DatabaseConnection.query "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') returning id, url, title;"
    Bookmark.new(results[0]['id'], results[0]['url'], results[0]['title'])
  end

  def self.delete(id)
    results = DatabaseConnection.query "DELETE FROM bookmarks WHERE id = '#{id}';"
    results.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.one(id)
    results = DatabaseConnection.query "SELECT * FROM bookmarks WHERE id = #{id};"
    Bookmark.new(results[0]['id'], results[0]['url'], results[0]['title'])
  end

  def self.update(bookmark)
    results = DatabaseConnection.query "UPDATE BOOKMARKS SET url = '#{bookmark.url}', title = '#{bookmark.title}' WHERE id = #{bookmark.id} RETURNING id, url, title;"
    Bookmark.new(results[0]['id'], results[0]['url'], results[0]['title'])
  end
end
