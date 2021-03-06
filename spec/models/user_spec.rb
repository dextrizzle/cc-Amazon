require 'rails_helper'

RSpec.describe User, type: :model do
  def valid_attributes(new_attributes = {})
    {
        first_name: 'Bob',
        last_name: 'Saget',
        email: 'bob@example.com',
        password: '12345678'
    }.merge new_attributes
  end

  describe 'validations' do
    it 'requires a first_name' do
      user = User.new(valid_attributes({first_name: nil}))
      expect(user).to be_invalid
    end
    it 'requires a last_name' do
      user = User.new(valid_attributes({last_name: nil}))
      expect(user).to be_invalid
    end
    it 'requires an email' do
      user = User.new(valid_attributes({email: nil}))
      expect(user).to be_invalid
    end
    it 'requires a unique email' do
      user = User.create(valid_attributes)
      user_2 = User.create(valid_attributes)
      expect(user_2.errors).to have_key(:email)
    end
  end

  describe 'full_name method' do
    it 'returns the first name and last name concatenated and titleized' do
      bob_saget = "#{valid_attributes[:first_name]} #{valid_attributes[:last_name]}"
      user = User.new(valid_attributes)
      expect(user.full_name).to eq(bob_saget)
    end
    it 'returns the first_name only if the first_name is given' do

    end
  end
end

