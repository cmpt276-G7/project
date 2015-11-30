module AuthenticationsHelper

  #returns true if user has a facebook authentication
  #later should check if a successful api call can be made (token is not expired)
  def fb_authenticated?(user)
    if user.authentications.where(provider: "facebook").exists?
      fbauth = user.authentications.find_by(provider: "facebook")
      fbdata = User.koala(fbauth['token'])

      !fbdata['name'].nil?
    end
  end

  def twitter_authenticated?(user)
    if user.authentications.where(provider: "twitter").exists?
      twitterauth = user.authentications.find_by(provider: "twitter")
      data = Post.Twitterget(twitterauth.token, twitterauth.secret)

      !data.nil?
    end
  end

end
