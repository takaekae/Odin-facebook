class TextPost < ApplicationRecord
  has_one :post, as: :postable
end
