class Company < ApplicationRecord
  has_many :posts, foreign_key: :company_id
  has_secure_password
end
