require './app.rb'

feature 'viewing bookmarks' do
  scenario 'user can visit bookmark page to view bookmarks' do
    connection = PG.connect :dbname => 'bookmark_manager_test'

    Bookmark.create("http://www.nandos.com")
    Bookmark.create("http://www.mcdonalds.com")
    Bookmark.create("http://www.justeat.com")

    visit('/bookmarks')

    expect(page).to have_content("http://www.nandos.com")
    expect(page).to have_content("http://www.mcdonalds.com")
    expect(page).to have_content("http://www.justeat.com")
  end
end
