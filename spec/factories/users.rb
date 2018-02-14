FactoryBot.define do
  factory :user do
    name "MyString"
    email "michael@example.com"
    password "foobar11"
    password_confirmation "foobar11"
    email_confirmed "True"
  end
end
