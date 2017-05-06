class User < ApplicationRecord


  def self.register(firebase_id,name)
    user = User.new({
        firebase_id: firebase_id,
        name: name,
        joined_at: Time.now,
        expires_at: Time.now + 2.minutes
    })

    user.save
    user
  end

  def renew_subscription
    self.expires_at = Time.now + 2.minutes
    self.save
    self
  end

end
