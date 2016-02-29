FactoryGirl.define do
  factory :user do
    email 'bob@gmail.com'
    password 'password'
    password_confirmation 'password'
  end
end
