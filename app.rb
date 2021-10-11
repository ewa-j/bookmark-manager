# frozen_string_literal: true

require "sinatra"
require "sinatra/reloader"

# class
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Hello World!"
  end
end
