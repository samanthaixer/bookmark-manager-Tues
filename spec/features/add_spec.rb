require './app.rb'

feature 'add new bookmarks' do
  scenario 'from the website, I can add a bookmark' do
    # connection = PG.connect :dbname => 'bookmark_manager_test'
    visit('/bookmarks')
    fill_in('url', :with => 'http://www.gov.uk')
    fill_in('title', :with => 'Gov Site')
    click_button('add_bookmark')
    expect(page).to have_content("Gov Site")
  end
end

feature 'add to existing bookmarks' do
  scenario 'from the website, I can add a second bookmark' do
    Bookmark.create("http://www.bakeoff.com", "Bake Off")

    visit('/bookmarks')
    fill_in('url', :with => 'http://www.gov.uk')
    fill_in('title', :with => 'Gov Site')
    click_button('add_bookmark')
    expect(page).to have_content("Gov Site")
    expect(page).to have_content("Bake Off")
  end
end
