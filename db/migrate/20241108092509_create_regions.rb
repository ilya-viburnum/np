class CreateRegions < ActiveRecord::Migration[7.2]
  def change
    create_table :regions do |t|
      t.string :name, null: false, default: ""
      t.timestamps
    end

    add_index :regions, :name, unique: true
  end
end
