FactoryGirl.define do
  factory :product do
    sequence(:title) { |t| "Cool Product Title #{t}" }
    description 'Some description of the product'
    price 100
  end
end
