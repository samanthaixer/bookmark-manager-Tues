
require 'pg'
class Bookmark
  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'bookmark_manager_test', :user => 'gregpaul'
    else
      connection = PG.connect :dbname => 'bookmark_manager', :user => 'gregpaul'
    end

    table_results = connection.exec "SELECT * FROM bookmarks"

    table_results.map { |bookmark| bookmark['url'] }
  end
end
