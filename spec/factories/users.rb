FactoryGirl.define do
  factory :user do
    first_name 'john'
    last_name 'smith'
    sequence(:email) { |n| "john#{n}@example.com" }
    password '12345678'
  end
end
