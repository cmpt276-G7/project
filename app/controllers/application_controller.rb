class ApplicationController < ActionController::Base
	
	include Facebooker2::Rails::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def ensure_authenticated
  	if current_facebook_user.nil?
  		redirect_to url_for(:controller=>"login")
  	else
  		User.find_or_create_byfacebook_id(current_facebook_user_id)	

end
