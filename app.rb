require 'rubygems'
require 'sinatra'

site_url = ENV['SITE_URL'] || 'http://railstutorial.jp'

get '/' do
  redirect site_url, 301 if request.host =~ /\.herokuapp\.com$/
  erb :index
end

get '/index.html' do
  redirect '/'
end

