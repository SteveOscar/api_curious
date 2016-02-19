class User < ActiveRecord::Base
  validates_presence_of :provider, :uid, :name

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
    user.name = auth['info']['name']
    user.bio = auth['info']['description']
    user.image_url = auth['info']['image'].sub("_normal", "")
    user.token = auth['credentials']['token']
    user.secret = auth['credentials']['secret']

    user.save

    user
  end
end
