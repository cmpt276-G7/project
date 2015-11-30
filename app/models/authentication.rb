class Authentication < ActiveRecord::Base
  belongs_to :user

  def updatecredentials(response)
    self.token = response["credentials"]["token"]
    self.secret = response["credentials"]["secret"]
    self.expires = response["credentials"]["expires"]
    self.expires_at = response["credentials"]["expires_at"]
    self.uid = response["uid"]
    self.save
  end

end
