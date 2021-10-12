feature "viewing bookmarks" do
  scenario "user can see all added bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "http://www.codecademy.com"
    expect(page).to have_content "https://www.theodinproject.com"
    expect(page).to have_content "https://www.udemy.com"
  end
end
