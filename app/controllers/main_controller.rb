class MainController < ApplicationController
  before_action :disable_flash_messages, only: [:home]
  before_action :require_user_is_logged_in, only: [:home]

  require 'news-api'

  def home
    newsApi = News.new(ENV['NEWSAPI_KEY'])
    @newsBatch = newsApi.get_everything(q: "crime", sources: "bbc-news")
    # puts @newsBatch.inspect

  end

  def about; end
end
