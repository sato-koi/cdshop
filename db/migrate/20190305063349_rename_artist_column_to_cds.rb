class RenameArtistColumnToCds < ActiveRecord::Migration[5.2]
  def up
    add_reference :cds, :artist, foreign_key: true, index: true, after: :description
  end

  def down
    remove_column :cds, :artist
  end
end
