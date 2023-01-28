class Profile < ApplicationRecord
  # Post attributes: avatar (as attachment), intro, location
  # just simple stuff for now

  belongs_to :user

  has_one_attached :avatar
end
