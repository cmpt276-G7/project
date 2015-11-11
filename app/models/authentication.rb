class Authentication < ActiveRecord::Base
  belongs_to :user

  def updatecredentials(credentials)
    self.token = credentials["token"]
    self.secret = credentials["secret"]
    self.expires = credentials["expires"]
    self.expires_at = credentials["expires_at"]
    self.save
  end

end
