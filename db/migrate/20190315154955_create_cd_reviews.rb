class CreateCdReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :cd_reviews do |t|
      t.string :title, null: false, length: 50
      t.text :body, null: false, length: 500
      t.integer :evaluation, null: false
      t.references :cd, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :cd_reviews, [:cd_id, :user_id], unique: true
  end
end
