class RemoveDeviseFromCompany < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :encrypted_password
    remove_column :companies, :reset_password_token
    remove_column :companies, :reset_password_sent_at
    remove_column :companies, :remember_created_at
    remove_column :companies, :sign_in_count
    remove_column :companies, :current_sign_in_at
    remove_column :companies, :last_sign_in_at
    remove_column :companies, :current_sign_in_ip
    remove_column :companies, :last_sign_in_ip
  end
end
