class AddCompanyInfoToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :contact_person, :string
    add_column :companies, :phone, :string
  end
end
