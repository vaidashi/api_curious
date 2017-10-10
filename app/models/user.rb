class User < ApplicationRecord

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth['uid'])

    user.nickname = auth['info']['nickname']
    user.uid = auth['info']['uid']
    user.token = auth['credentials']['token']

    user.save
    user
  end

end
