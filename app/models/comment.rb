class Comment < ApplicationRecord
  #attributes: user_id, post_id, body
  #you can comment on a post, but not on a comment

  belongs_to :user
  belongs_to :post
end
