class ChaptersController < ApplicationController

  before_filter :heroku_cache

  def index
    @content = File.open("public/book/index.html").read
  end

  def show
    chapter = params[:id]
    @content = File.open("public/book/#{chapter}_fragment.html").read
  end
end
