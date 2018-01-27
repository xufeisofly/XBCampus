class AddIndexToMajorId < ActiveRecord::Migration[5.1]
  def change
    add_index :fields, [:major_id]
  end
end
