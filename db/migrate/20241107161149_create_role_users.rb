class CreateRoleUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :role_users do |t|
      t.references :role
      t.references :user
      t.timestamps
    end

    add_index :role_users, [ :role_id, :user_id ], unique: true
  end
end
