class AddCompanyIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :company_id, :integer, index: true
  end
end
