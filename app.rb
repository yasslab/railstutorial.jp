require 'rubygems'
require 'sinatra'

get '/' do
  erb :index
end

get '/index.html' do
  redirect 'http://railstutorial.jp/'
end

