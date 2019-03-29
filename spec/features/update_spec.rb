feature 'updating bookmarks' do
  scenario 'Creating a bookmark and then pressing update' do
    bookmark = Bookmark.create("http://www.goggle.com", "Goggle")

    visit '/bookmarks'
    expect(page).to have_link("Goggle", href:"http://www.goggle.com")

    first('.bookmark').click_button 'Update'
    expect(page).to have_content("Enter your updates here")
    expect(page).to have_css("input", :count => 3)
  end

  scenario 'Creating a bookmark and then updating it' do
    bookmark = Bookmark.create("http://www.goggle.com", "Goggle")

    visit '/bookmarks'
    first('.bookmark').click_button 'Update'

    fill_in('url', :with => 'http://www.google.com')
    fill_in('title', :with => 'Google')
    click_button 'Update Bookmark'

    expect(page).to have_link("Google", href:"http://www.google.com")
    expect(page).to have_no_link("Goggle", href:"http://www.goggle.com")

  end
end
