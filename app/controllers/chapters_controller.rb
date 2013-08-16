class ChaptersController < ApplicationController
  before_filter :heroku_cache, :default_params
  include ApplicationHelper

  def index
    @content = File.open("app/views/shared/#{@version}/_navigation.html.erb").read
  end

  def show
    chapter  = params[:id]
    if File.exist?("public/books/#{@version}/#{chapter}_fragment.html")
      @content = File.open("public/books/#{@version}/#{chapter}_fragment.html").read
    else
      redirect_to "/?version=#{@version}"
    end
  end

  def book
    @content = File.open("public/books/#{@version}/book_fragment.html").read
  end

  def old
    # redirect to the corresponding page if visited old URL
    chapter  = params[:chapter]

    if File.exist?("public/books/#{@version}/#{chapter}_fragment.html")
      redirect_to "/chapters/#{chapter}?version=4.0#top"
    else
      redirect_to "/"
    end
  end

  private

  def default_params
    @anchor  = params[:anchor]  || 'top'
    @version = params[:version] || '3.2'
  end
end
