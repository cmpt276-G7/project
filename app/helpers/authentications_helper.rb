module AuthenticationsHelper

  #returns true if user has a facebook authentication
  #later should check if a successful api call can be made (token is not expired)
  def fb_authenticated?(user)
    #if user.authentications.where(provider: "facebook").exists?
      #fbauth = user.authentications.where(provider: "facebook")
      #fbdata = user.Koala(fbauth['credentials']['token'])

      #return fbdata['name'].exists?
    #end
  end

end

#def fb_authenticated?(user)
#  if user.authentications.where(provider: "facebook").exists?
#    fbauth = user.authentications.where(provider: "facebook")
#    fbdata = user.Koala(fbauth['credentials']['token'])

#    return fbdata['name'].exists?
#  end
#end
