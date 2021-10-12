feature "index" do
  scenario "expect page to show Bookmark Manager" do
    visit("/")
    expect(page).to have_content "Bookmark Manager"
  end
end
