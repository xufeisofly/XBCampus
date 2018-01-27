class MajorSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :fields
end
