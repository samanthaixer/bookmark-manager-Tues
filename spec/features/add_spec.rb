require './app.rb'

feature 'adding bookmarks' do
  scenario 'from the website, I can add a bookmark' do
    # connection = PG.connect :dbname => 'bookmark_manager_test'
    visit('/bookmarks')
    fill_in('new_bookmark', :with => 'http://www.gov.uk')
    click_button('add_bookmark')
    expect(page).to have_content("http://www.gov.uk")
  end
end

feature 'adding bookmarks' do
  scenario 'from the website, I can add a bookmark' do
    connection = PG.connect :dbname => 'bookmark_manager_test'
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.bakeoff.com');")

    visit('/bookmarks')
    fill_in('new_bookmark', :with => 'http://www.gov.uk')
    click_button('add_bookmark')
    expect(page).to have_content("http://www.gov.uk")
    expect(page).to have_content("http://www.bakeoff.com")
  end
end
