class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request

    if @contact.deliver
      # re-initialize Contact object for cleared form
      @contact = Contact.new
      flash.now[:notice] = "Thank you for your message. We'll get back to you soon!"
      render 'index'
    else
      flash.now[:alert] = "Message did not send."
      render 'index'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
