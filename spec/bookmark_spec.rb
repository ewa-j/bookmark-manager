require "bookmark"

describe Bookmark do
  describe ".view" do
    it "returns all bookmarks" do
      bookmarks = Bookmark.view

      expect(bookmarks).to include("http://www.codecademy.com")
      expect(bookmarks).to include("https://www.theodinproject.com")
      expect(bookmarks).to include("https://www.udemy.com")
    end
  end
end
