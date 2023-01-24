class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :post_picture, dependent: :destroy

  validates :body, presence: true

  def liked_by?(user)
    likes.any? { |like| like.user == user }
  end

  def find_like(user)
    likes.find_by(user_id: user.id)
  end
end
