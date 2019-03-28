feature 'Deleting bookmarks' do
  scenario 'deleting a bookmark from a list of existing bookmarks' do
    Bookmark.create("http://www.google.com", "Google")
    Bookmark.create("http://www.gov.uk", "Gov Site")

    visit '/bookmarks'

    fill_in('delete_title', :with => "Gov Site")
    click_button "delete"

    expect(page).to have_no_link(href: "http://www.gov.uk")
  end
end
