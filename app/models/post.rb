class Post < ActiveRecord::Base
  def self.FBget(authtoken)
    facebook = Koala::Facebook::API.new(authtoken)
    facebook.get_object("me/feed?limit=50")
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
