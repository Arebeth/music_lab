require 'sinatra'  
require 'sinatra/activerecord'
require 'pry'
require "better_errors"
require 'pg'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

set :conn, PG.connect(dbname: 'sinatrasql')

before do 
  @conn = settings.conn
end

settings.conn

get '/' do 
  "Hello world"
end
  
