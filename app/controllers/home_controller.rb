class HomeController < ApplicationController
  def index
    # Logic for the index action
    @message = "Welcome to the home page!"
  end

  def about
    # Logic for the about action
    @about_text = "This is the about page."
  end

  def contact
    # Logic for the contact action
    @contact_info = {
      email: "contact@example.com",
      phone: "123-456-7890"
    }
  end
end
