class PostsController < ApplicationController
  include SessionsHelper
  include AuthenticationsHelper

  #get facebook posts
  def getfbposts
    @user = current_user

    if fb_authenticated?(@user)
      auth = @user.authentications.find_by(provider: 'facebook')
      posts = Post.FBget(auth['token'])

      posts.each do |post|
        @user.posts.create(author: post['from']['name'], message: post['message'],
        provider: "facebook", picture: post['from']['picture']['data']['url'].to_s,
        link: post['link'], timeposted: post['created_time'].to_time)
      end
    end

  end

  #get twitter posts
  def gettwitterposts
    @user = current_user

    if twitter_authenticated?(@user)
      twitterauth = @user.authentications.find_by(provider: 'twitter')
      posts = Post.Twitterget(twitterauth.token, twitterauth.secret)

      posts.each do |post|
        @user.posts.create(author: post.user.screen_name, message: post.text,
        provider: "twitter", picture: post.user.profile_image_url.to_s,
        link: "https://twitter.com/statuses/"+post.id.to_s, timeposted: post.created_at.to_time)
      end
    end
  end


  def index
    @user = current_user
    @user.posts.destroy_all
    getfbposts
    gettwitterposts

    #add to @posts instance var
    @posts = @user.posts.all
    @posts.order! 'timeposted DESC'

  end

  def facebookfeed
    @user = current_user
    @user.posts.destroy_all
    getfbposts

    #add to @posts instance var
    @posts = @user.posts.all
    @posts.order! 'timeposted DESC'

  end

  def twitterfeed
    @user = current_user
    @user.posts.destroy_all
    gettwitterposts

    #add to @posts instance var
    @posts = @user.posts.all
    @posts.order! 'timeposted DESC'
  end

  def customfeed
    @user = current_user

    if !params[:searchterm].blank?
      render plain: params[:searchterm]
    end

  end



end
