require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }
  # it "returns a list of all bookmarks" do
  #   expect(Bookmark.all).to eq(["www.bbc.co.uk", "www.tesco.co.uk", "www.guardian.co.uk"])
  # end

  it "selects all rows from the database" do
    Bookmark.create("http://www.nandos.com")
    Bookmark.create("http://www.mcdonalds.com")
    Bookmark.create("http://www.justeat.com")

    bookmarks = Bookmark.all

    expect(bookmarks).to include("http://www.nandos.com")
    expect(bookmarks).to include("http://www.mcdonalds.com")
    expect(bookmarks).to include("http://www.justeat.com")
  end

  it "adds a new bookmark" do
    Bookmark.create("http://www.bbc.co.uk")

    bookmarks = Bookmark.all

    expect(bookmarks).to include("http://www.bbc.co.uk")
  end
end
