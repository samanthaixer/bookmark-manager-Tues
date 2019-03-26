require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }
  # it "returns a list of all bookmarks" do
  #   expect(Bookmark.all).to eq(["www.bbc.co.uk", "www.tesco.co.uk", "www.guardian.co.uk"])
  # end

  it "connects to PostgreSQL using PG gem" do
    expect(Bookmark.all).to include("http://google.com")
  end
end
