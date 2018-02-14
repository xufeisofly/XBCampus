class AddMajorIdToFields < ActiveRecord::Migration[5.1]
  def change
    add_column :fields, :major_id, :integer
    remove_column :fields, :major
  end
end
