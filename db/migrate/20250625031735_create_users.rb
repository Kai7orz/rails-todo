class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_mail
      t.string :user_password

      t.timestamps
    end
  end
end
