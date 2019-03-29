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
    Bookmark.delete(bookmark.id)
    expect(Bookmark.all.first).to have_attributes(:title => "Yahoo")
  end

  it 'returns just one bookmark based on an ID' do
    bookmark = Bookmark.create("http://www.askjeeves.com", "Ask Jeeves")
    expect(Bookmark.one(bookmark.id)).to have_attributes(:title => "Ask Jeeves")
  end

  it 'updates a bookmark' do
    bookmark = Bookmark.create("http://www.goggle.com", "Goggle")
    bookmark_2 = Bookmark.new(bookmark.id, "http://www.google.com", "Google")
    expect(Bookmark.update(bookmark_2)).to have_attributes(:title => "Google", :url => "http://www.google.com")
  end

end
