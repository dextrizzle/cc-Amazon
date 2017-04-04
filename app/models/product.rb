class Product < ApplicationRecord

  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates(:title, { presence: true, uniqueness: true })
  validates(:description,{ presence: true, length: { minimum: 10 } })
  validates :price,{ presence: true, numericality: true }


  after_initialize :set_defaults
  before_validation :titleize_title

  # def self.search(find)
  #   self.where(["title ILIKE ? OR description ILIKE ?", "%"+find+"%", "%"+find+"%"])
  # end


  # def self.search(find)
  #   results = self.where("title like ?", "%#{find}%")
  #   results.or self.where("description like ?", "%#{find}%")
  #   results
  # end

  def self.search(string)
    where(['title ILIKE ? OR description ILIKE ?', "%#{string}%", "%#{string}%"]).order(['description ILIKE ?', "%#{string}%"], ['title ILIKE ?', "%#{string}%"])
  end

  private

  def titleize_title
    self.title = title.capitalize if title.present?
  end

  def set_defaults
    self.price ||= 1.0
    self.sale_price ||= 1.0
  end

end
