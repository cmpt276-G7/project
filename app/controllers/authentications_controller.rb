class AuthenticationsController < ApplicationController
  include SessionsHelper
  include AuthenticationsHelper

  def index
    @user = current_user
#    @authentication = Authentication.find_by(user_id: @user.id)
    @authentications = Authentication.find_by(user_id: @user.id)

    if fb_authenticated?(@user)
      #fbauth = @authentications.find_by(provider: "facebook")
      #@fbdata = User.koala(fbauth.token)
    end

  end

  def create
    @user = current_user
    auth = request.env["omniauth.auth"]
    if @user.authentications.where(provider: auth['provider']).where(uid: auth['uid']).exists?

      thisauth = @user.authentications.find_by(provider: auth['provider'], uid: auth['uid'])
      thisauth.updatecredentials(auth["credentials"])
      flash[:success] = "Authentication renewed!"

    else
      @user.authentications.create(provider: auth['provider'], uid: auth['uid'],
          token: auth['credentials']['token'], secret: auth['credentials']['secret'],
          expires: auth['credentials']['expires'], expires_at: auth['credentials']['expires_at'])
      flash[:success] = "Authentication successful!"

    end

    #need to take all authentications later
    @authentications = Authentication.where(user_id: @user.id).take

    #filling facebook data
    #if auth['provider'] == 'facebook'
    #  @fbdata = User.koala(auth['credentials']['token'])
    #elsif @user.authentications.where(provider: 'facebook').exists?
    #  fbauth = @user.authentications.find(provider: 'facebook')
    #  @fbdata = User.koala(fbauth.token)
    #end

    #redirect_to user_authentications_url(current_user)
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:success] = "Successfully destroyed authentication."
    redirect_to user_authentications_url(current_user)
  end

end
