namespace :db do
  desc "Fill database with sample code"
  task populate: :environment do
    User.create!(name: "lynn",
                 email: "lynn1@example.com",
                 password: "foobar11",
                 password_confirmation: "foobar11")
    99.times do |n|
        name = Faker::Name.name
        email = "example-#{n+2}@example.com"
        password = "foobar11"
        User.create!(name: name,
                     email: email,
                     password: password,
                     password_confirmation: password)
    end
  end
end