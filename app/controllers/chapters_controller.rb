class ChaptersController < ApplicationController
  before_filter :heroku_cache
  include ApplicationHelper

  def index
    @version = params[:version]
    if third_edition? @version
      @content = File.open("public/books/4.0/index.html").read
    else
      @content = File.open("public/books/3.2/index.html").read
    end
  end

  def show
    chapter  = params[:id]
    @version = params[:version]
    if third_edition? @version
      @content = File.open("public/books/4.0/#{chapter}_fragment.html").read
    else
      @content = File.open("public/books/3.2/#{chapter}_fragment.html").read
    end
  end

  def old
    # redirect to the corresponding page if visited old URL
    chapter  = params[:chapter]
    @version = params[:version]

    if File.exist?("public/books/#{@version}/#{chapter}_fragment.html")
      redirect_to "/chapters/#{chapter}?version=4.0#top"
    else
      redirect_to "/"
    end
  end

end
