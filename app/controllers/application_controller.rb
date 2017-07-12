class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :current_cart

  def current_cart
  	session[:cart] ||= []
  	session[:cart].map! {|x| x.symbolize_keys!}
  end

  def check_admin
  	  	redirect_to orders_path unless admin?
  end	

  @@total = 0
end
