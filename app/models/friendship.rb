class Friendship < ApplicationRecord
  #attributes: user_id, friend_id

  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
