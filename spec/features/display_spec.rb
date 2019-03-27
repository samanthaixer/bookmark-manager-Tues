require './app.rb'

feature 'viewing bookmarks' do
  scenario 'user can visit bookmark page to view bookmarks' do

    Bookmark.create("http://www.nandos.com", "Nandos")
    Bookmark.create("http://www.mcdonalds.com", "McDs")
    Bookmark.create("http://www.justeat.com", "Just Eat")

    visit('/bookmarks')

    expect(page).to have_content("Nandos")
    expect(page).to have_content("McDs")
    expect(page).to have_content("Just Eat")
  end
end
