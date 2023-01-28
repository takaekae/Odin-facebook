class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #User attributes: username, name, email, encrypted password

  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      #auth.extra.raw_info.username.present? ? user.username = auth.extra.raw_info.username : user.username = auth.info.first_name
      user.username = auth.info.name
      user.name = auth.info.name   # assuming the user model has a name

      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  has_many :friendships, foreign_key: :user_id, class_name: 'Friendship'
  has_many :friends, through: :friendships

  has_many :sent_friend_requests, foreign_key: :requesting_friend_id, class_name: 'Request'
  has_many :requested_friends, through: :sent_friend_requests

  has_many :received_friend_requests, foreign_key: :requested_friend_id, class_name: 'Request'
  has_many :requesting_friends, through: :received_friend_requests

  has_many :posts
  has_many :likes
  has_many :comments

  has_one :profile

  #after_create :send_welcome_email #temporarily disabled for heroku deployment

  def send_welcome_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end

end
