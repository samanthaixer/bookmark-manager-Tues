require 'sinatra/base'
require_relative './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  # get '/' do
  #   'Welcome to Bookmark Manager'
  # end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks/create' do
    Bookmark.create(params[:bookmark], params[:title])
    @bookmarks = Bookmark.all
    erb :'bookmarks/create'
  end

  post '/bookmarks/delete' do
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
