class RenameArtistColumnToCds < ActiveRecord::Migration[5.2]
  def up
    remove_column :cds, :artist
    add_reference :cds, :artist, foreign_key: true, index: true, after: :description
  end

  def down
    remove_column :cds, :artist_id
    add_column :cds, :artist, :string
  end
end
