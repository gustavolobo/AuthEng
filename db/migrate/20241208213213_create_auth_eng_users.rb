class CreateAuthEngUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :auth_eng_users do |t|
      t.string :email

      t.timestamps
    end
  end
end
