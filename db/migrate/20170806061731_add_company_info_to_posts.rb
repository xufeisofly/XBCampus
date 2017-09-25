class AddCompanyInfoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :contact_person, :string
  end
end
