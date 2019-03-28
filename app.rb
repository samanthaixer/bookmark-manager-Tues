require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  # get '/' do
  #   'Welcome to Bookmark Manager'
  # end
  enable :method_override

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks/create' do
    Bookmark.create(params[:url], params[:title])
    @bookmarks = Bookmark.all
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
