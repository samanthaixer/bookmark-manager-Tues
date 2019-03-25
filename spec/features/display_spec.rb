require './app.rb'

feature 'index page' do
  scenario 'user sees index page' do
    visit('/')
    expect(page).to have_content('Welcome to Bookmark Manager')
  end
end
