class RenameUserPasswordColumnToUsers < ActiveRecord::Migration[8.0]
  def change
       rename_column :users, :user_password, :password_digest
  end
end
