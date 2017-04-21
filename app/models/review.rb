class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :body, presence: true

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def liked_by?(user)
    likes.find_by_user_id(user.id).present?
  end
end
