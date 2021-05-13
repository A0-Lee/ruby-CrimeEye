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

  def contact
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request

    if @contact.deliver
      # re-initialize Contact object for cleared form
      @contact = Contact.new
      flash.now[:notice] = "Thank you for your message. We'll get back to you soon!"
      render 'contact'
    else
      flash.now[:alert] = "Message did not send."
      render 'contact'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
