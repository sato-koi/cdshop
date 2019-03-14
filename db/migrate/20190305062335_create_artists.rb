class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, null: false, length: 50
      t.string :url
      t.text :description, null: false, length: 1000

      t.timestamps
    end
  end
end
