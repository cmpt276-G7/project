class Post < ActiveRecord::Base
  def self.FBget(authtoken)
    facebook = Koala::Facebook::API.new(authtoken)
    facebook.get_object("me/feed?limit=50")
  end
end
