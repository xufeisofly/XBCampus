class Major < ApplicationRecord
  has_many :fields, dependent: :destroy
end
