class PostsController < ApplicationController
  include SessionsHelper
  include AuthenticationsHelper

  def index
    @user = current_user

    if fb_authenticated?(@user)
      auth = @user.authentications.find_by(provider: 'facebook')
      @posts = Post.FBget(auth['token'])
    end

    @posts2 = Post.Twitterget("asdf")

  end

end
