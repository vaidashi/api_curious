class User < ApplicationRecord
  validates_presence_of :nickname, :uid
  # validates :nickname, presence: true
  # validates :uid, presence: true

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(uid: auth['uid'])

    user.nickname = auth['info']['nickname']
    user.uid = auth['info']['uid']
    user.token = auth['credentials']['token']

    user.save
    user
  end

 ##possible fix for token issue

  # def self.from_omniauth(auth_info)
  #   user = User.where(uid: auth_info.uid).first
  #   if !user.nil? && user.oauth_token == auth_info.credentials.token
  #     user
  #   elsif !user.nil?
  #     user.oauth_token = auth_info.credentials.token
  #     user.save
  #     user
  #   else
  #     User.create(uid: auth_info.uid, name: auth_info.info.name, nickname: auth_info.info.nickname, oauth_token: auth_info.credentials.token)
  #     user
  #   end
  # end

end
