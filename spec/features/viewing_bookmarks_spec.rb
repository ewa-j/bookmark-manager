require "pg"

feature "viewing bookmarks" do
  scenario "user can see all added bookmarks after visiting /bookmarks" do
    # connection = PG.connect(dbname: "bookmark_manager_test")

    # # adding the test data
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.codecademy.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.theodinproject.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.udemy.com');")
    Bookmark.create(url: "http://www.codecademy.com", title: "Codecademy")
    Bookmark.create(url: "https://www.theodinproject.com", title: "The Odin Project")
    Bookmark.create(url: "https://www.udemy.com", title: "Udemy")

    visit("/bookmarks")

    expect(page).to have_link("Codecademy", href: "http://www.codecademy.com")
    expect(page).to have_link("The Odin Project", href: "https://www.theodinproject.com")
    expect(page).to have_link("Udemy", href: "https://www.udemy.com")
  end
end
