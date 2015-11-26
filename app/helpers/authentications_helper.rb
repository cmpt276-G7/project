module AuthenticationsHelper

  #returns true if user has a facebook authentication
  #later should check if a successful api call can be made (token is not expired)
  def fb_authenticated?(user)
    user.authentications.where(provider: "facebook").exists?
  end

end
