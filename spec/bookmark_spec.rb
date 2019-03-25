require 'bookmark'

describe Bookmark do
  subject(:bookmark) { described_class.new }
  it "returns a list of all bookmarks" do
    expect(Bookmark.all).to eq(["www.bbc.co.uk", "www.tesco.co.uk", "www.guardian.co.uk"])
end
end
