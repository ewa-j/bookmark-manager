require "bookmark"

describe Bookmark do
  describe ".view" do
    it "returns list of all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")

      # adding the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.codecademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.theodinproject.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.udemy.com');")

      bookmarks = Bookmark.view

      expect(bookmarks).to include("http://www.codecademy.com")
      expect(bookmarks).to include("https://www.theodinproject.com")
      expect(bookmarks).to include("https://www.udemy.com")
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      Bookmark.create(url: "http://www.example.org")

      expect(Bookmark.view).to include "http://www.example.org"
    end
  end
end
