class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_id
      t.string :password_digest
      t.string :access_token

      t.timestamps null: false
    end
  end
end
