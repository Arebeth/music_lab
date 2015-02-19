require 'sinatra'  
require 'sinatra/activerecord'
require './models/artist'
require 'pry'
require "better_errors"
require 'pg'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do 
  redirect '/artists'
end

get '/artists' do 
  @artist = Artist.all
  erb :index
end

get '/artists/new' do 
  @artist = Artist.create
  erb :new
end

get '/artists/:id' do 
  @artist = Artist.find_by(:name)
  erb :new
end
