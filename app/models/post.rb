class Post < ApplicationRecord
  include VersionDiff::Model

	belongs_to :company
	validates :company_id, presence: true
	has_many :comments
end
