class ImagePost < ApplicationRecord
  has_one :post, as: :postable

  has_one_attached :image #optional, otherwise stored in URL
end
