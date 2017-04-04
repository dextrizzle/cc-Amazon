class Review < ApplicationRecord
  belongs_to :product
  validates :body, presence: true
end
