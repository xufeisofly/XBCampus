class AddUsernameToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :username, :string
  end
end
