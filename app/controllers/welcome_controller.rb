class WelcomeController < ApplicationController
  def index
  	redirect_to categories_path if logged_in?
  end
end
