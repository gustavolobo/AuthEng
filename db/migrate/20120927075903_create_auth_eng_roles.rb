class CreateAuthEngRoles < ActiveRecord::Migration
  def change
    create_table :auth_eng_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
