require "sinatra"
require "sinatra/reloader"
require "./lib/bookmark"

# class
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Bookmark Manager"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.view
    erb :"bookmarks/index"
  end

  get "/bookmarks/new" do
    erb :"bookmarks/new"
  end

  post "/bookmarks" do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect "/bookmarks"
  end

  run! if app_file == $0
end
