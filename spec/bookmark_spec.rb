require "bookmark"
require "database_helpers"

describe Bookmark do
  describe ".view" do
    it "returns list of all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")

      # adding the test data
      bookmark = Bookmark.create(url: "http://www.codecademy.com", title: "Codecademy")
      Bookmark.create(url: "https://www.theodinproject.com", title: "The Odin Project")
      Bookmark.create(url: "https://www.udemy.com", title: "Udemy")
      bookmarks = Bookmark.view

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Codecademy"
      expect(bookmarks.first.url).to eq "http://www.codecademy.com"
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(url: "http://www.example.org", title: "Test Bookmark")
      persisted_data = PG.connect(dbname: "bookmark_manager_test").query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first["id"]
      expect(bookmark.title).to eq "Test Bookmark"
      expect(bookmark.url).to eq "http://www.example.org"
    end
  end
end
