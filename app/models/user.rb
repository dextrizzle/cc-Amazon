class User < ApplicationRecord
  #if you add an attribute accessor to an AR object then you will be able to capture that from the form and have it in memory but it will not be stored in the database if you do'nt have a db field for it
  #attr_accessor :abc  <<- put an :abc field in the form and you'll be able to use it's input


  #this is a built in rails method that helps us with user auth.
  #it will automatically add a presence validator for the password field
  #when given a password it will generate a salt and then it will hash the salt and password combo and will store the result of the Hashing (using bcrypt) along with the randomly generated salt into a database field called 'password_digest'
  #if you skip 'password_confirmation' field then it won't give you a validation error for it. if you provide 'password_confirmation' then it will validate that the password matches the password_confirmation
  #we will get a method called 'authenticate' which will test if the user has entered the correct password or not
  has_secure_password
  has_many :products
  has_many :reviews, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review

  validates(:first_name, { presence: true })
  validates(:last_name, { presence: true })
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, { presence: true, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX })

  before_validation :downcase_email


  def self.search(search_term)
    where(['first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?', "%#{search_term}%", "%#{search_term}%", "%#{search_term}%"])
  end

  def self.created_after(date)
    where(['created_at > ?', "#{date}"])
  end

  def self.is_not(name)
    where('first_name != ? AND last_name != ?', "#{name}", "#{name}")
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end


  private


  def downcase_email
    self.email.downcase! if email.present?
  end

end
