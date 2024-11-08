class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :status, default: "draft"
      t.references :user, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true
      t.timestamps
      t.datetime :published_at
    end
  end
end
