require './app.rb'

# feature 'index page' do
#   scenario 'user sees index page' do
#     visit('/')
#     expect(page).to have_content('Welcome to Bookmark Manager')
#   end

feature 'viewing bookmarks' do
  scenario 'user can visit bookmark page to view bookmarks' do
    connection = PG.connect :dbname => 'bookmark_manager_test'

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.nandos.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.mcdonalds.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.justeat.com');")

    visit('/bookmarks')

    expect(page).to have_content("http://www.nandos.com")
    expect(page).to have_content("http://www.mcdonalds.com")
    expect(page).to have_content("http://www.justeat.com")
  end
end
