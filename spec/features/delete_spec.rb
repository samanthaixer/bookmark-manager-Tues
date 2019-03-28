feature 'Deleting bookmarks' do
  scenario 'deleting a bookmark from a list of existing bookmarks' do
    Bookmark.create("http://www.google.com", "Google")
    Bookmark.create("http://www.gov.uk", "Gov Site")

    visit '/bookmarks'
    expect(page).to have_link('Google', href: 'http://www.google.com')
    expect(page).to have_link('Gov Site', href: 'http://www.gov.uk')

    first('.bookmark').click_button 'Delete'

    expect(page).to have_no_link('Google', href: 'http://www.google.com')
  end
end
