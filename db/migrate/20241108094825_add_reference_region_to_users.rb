class AddReferenceRegionToUsers < ActiveRecord::Migration[7.2]
  def change
    add_reference :users, :region, foreign_key: true
  end
end
