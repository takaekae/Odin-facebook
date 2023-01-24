class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         #for google Omniauth
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :invitations, dependent: :destroy
  has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"
  has_many :notifications, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { in: 3..10 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      user.username = auth.info.name
    end
  end

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def invitable?(user)
    !(Invitation.confirmed_record?(id, user.id) || Invitation.invited?(id, user.id))
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

  def sent_invite_to
    sent_invite_ids = Invitation.where(user_id: id, confirmed: false).pluck(:friend_id)
    User.where(id: sent_invite_ids)
  end

  def recieved_invite_from
    recieved_invite_ids = Invitation.where(friend_id: id, confirmed: false).pluck(:user_id)
    User.where(id: recieved_invite_ids)
  end

  def send_notification(body)
    notifications.create(body: body)
  end
end
