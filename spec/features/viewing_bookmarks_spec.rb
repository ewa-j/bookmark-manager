require "pg"

feature "viewing bookmarks" do
  scenario "user can see all added bookmarks" do
    connection = PG.connect(dbname: "bookmark_manager_test")

    # adding the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.codecademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.theodinproject.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.udemy.com');")

    visit("/bookmarks")

    expect(page).to have_content "http://www.codecademy.com"
    expect(page).to have_content "https://www.theodinproject.com"
    expect(page).to have_content "https://www.udemy.com"
  end
end
