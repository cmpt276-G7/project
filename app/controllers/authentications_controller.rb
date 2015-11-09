class AuthenticationsController < ApplicationController
  include SessionsHelper

  def index
    @authentications = Authentication.all
    @user = current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    if Authentication.where(provider: auth['provider']).where(uid: auth['uid']).exists?
      flash[:success] = "Authentication successful 1"
    else
      current_user.authentications.create(provider: auth['provider'], uid: auth['uid'])
      flash[:success] = "Authentication successful."
    end
    redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:success] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

end
