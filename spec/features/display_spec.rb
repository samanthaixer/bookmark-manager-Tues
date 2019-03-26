require './app.rb'

# feature 'index page' do
#   scenario 'user sees index page' do
#     visit('/')
#     expect(page).to have_content('Welcome to Bookmark Manager')
#   end

feature 'viewing bookmarks' do
  scenario 'user can visit bookmark page to view bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content("http://google.com")
  end
end
