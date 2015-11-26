class Post < ActiveRecord::Base
  belongs_to :user

  def self.FBget(authtoken)
    facebook = Koala::Facebook::API.new(authtoken)
    ##can get more fields later depending on what we need,
    ##  but should make sure that twitter has same data we can scrap
    facebook.get_object("me/feed?fields=message,story,
    created_time,from{name,id,picture},picture,link&limit=50")
  end

  def self.Twitterget(authtoken)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Rjgh9eJVRHDLbD4zVAWECXsoF"
      config.consumer_secret     = "CASoUOkQ3xMuIw0lLG9jTNIJGcBYDp3WUDF9TT6zgRNKTjEG3O"
      config.access_token        = "346341072-w5DxUChgGkSRDjdNqHCNnK5OWk64el4NQT76Dn6O"
      config.access_token_secret = "SOiXMnqZT2MDhMVBAveID7OMAslLzwils7DJbnpIL85PY"
    end

    client.home_timeline
  end

end
