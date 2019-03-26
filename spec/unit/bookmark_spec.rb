require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }
  # it "returns a list of all bookmarks" do
  #   expect(Bookmark.all).to eq(["www.bbc.co.uk", "www.tesco.co.uk", "www.guardian.co.uk"])
  # end

  it "connects to PostgreSQL using PG gem" do
    connection = PG.connect :dbname => 'bookmark_manager_test'

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.nandos.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.mcdonalds.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.justeat.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include("http://www.nandos.com")
    expect(bookmarks).to include("http://www.mcdonalds.com")
    expect(bookmarks).to include("http://www.justeat.com")
  end
end
