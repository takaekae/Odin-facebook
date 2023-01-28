class Request < ApplicationRecord

  belongs_to :requesting_friend, class_name: 'User' #user sending the friend request
  belongs_to :requested_friend, class_name: 'User' #user receiving the friend request
end
