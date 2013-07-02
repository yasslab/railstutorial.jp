class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Use the Heroku Varnish cache.
  def heroku_cache
    if Rails.env.production?
      age = 1.day.to_i
      response.headers['Cache-Control'] = "public, max-age=#{age}"
    end
  end

end
