class PostsController < ApplicationController
  include SessionsHelper
  include AuthenticationsHelper

  def index
    @user = current_user
    @user.posts.destroy_all


    #get facebook posts
    if fb_authenticated?(@user)
      auth = @user.authentications.find_by(provider: 'facebook')
      posts = Post.FBget(auth['token'])

      posts.each do |post|
        @user.posts.create(author: post['from']['name'], message: post['message'],
        provider: "facebook", picture: post['from']['picture']['data']['url'].to_s,
        link: post['link'], timeposted: post['created_time'].to_time)
      end

    end

    #get twitter posts
    if twitter_authenticated?(@user)
      twitterauth = @user.authentications.find_by(provider: 'twitter')
      posts2 = Post.Twitterget(twitterauth.token, twitterauth.secret)
    end

    #add to @posts instance var
    @posts = @user.posts.all

  end

end
