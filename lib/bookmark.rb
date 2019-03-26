
require 'pg'
class Bookmark
  def self.all
    connection = PG.connect :dbname => 'bookmark_manager', :user => 'gregpaul'

    table_results = connection.exec "SELECT * FROM bookmarks"

    table_results.map { |bookmark| bookmark['url'] }
  end
end
