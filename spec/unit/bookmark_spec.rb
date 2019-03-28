require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }

  it "selects all rows from the database" do
    Bookmark.create("http://www.nandos.com", "Nandos")
    Bookmark.create("http://www.mcdonalds.com", "McDs")
    Bookmark.create("http://www.justeat.com", "Just Eat")

    bookmarks = Bookmark.all

    expect(bookmarks[0]).to have_attributes(:title => "Nandos")
    expect(bookmarks[1]).to have_attributes(:title => "McDs")
    expect(bookmarks[2]).to have_attributes(:title => "Just Eat")
  end

  it "adds a new bookmark" do
    Bookmark.create("http://www.bbc.co.uk", "BBC")

    expect(Bookmark.all[0]).to have_attributes(:title => "BBC")
  end

  it 'deletes a bookmark' do
    bookmark = Bookmark.create("http://www.askjeeves.com", "Ask Jeeves")
    Bookmark.create("http://www.yahoo.com", "Yahoo")
    expect(Bookmark.all.first).to have_attributes(:title => "Ask Jeeves")
    p bookmark
    Bookmark.delete(bookmark.id)
    expect(Bookmark.all.first).to have_attributes(:title => "Yahoo")
  end

end
