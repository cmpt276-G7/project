class AuthenticationsController < ApplicationController
  include SessionsHelper

  def index
    @user = current_user
#    @authentication = Authentication.find_by(user_id: @user.id)
    @authentications = Authentication.find_by(user_id: @user.id)

  end

  def create
    @user = current_user
    auth = request.env["omniauth.auth"]
    if Authentication.where(provider: auth['provider']).where(uid: auth['uid']).exists?
      flash[:success] = "Authentication renewed"
    else
      current_user.authentications.create(provider: auth['provider'], uid: auth['uid'])
      flash[:success] = "Authentication successful."
    end
    @authentications = Authentication.find_by(user_id: @user.id)
    @fbdata = User.koala(auth['credentials'])
    #redirect_to user_authentications_url(current_user)
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:success] = "Successfully destroyed authentication."
    redirect_to user_authentications_url(current_user)
  end

end
