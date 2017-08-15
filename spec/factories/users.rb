FactoryGirl.define do
  factory :user do
    name "MyString"
    email "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
