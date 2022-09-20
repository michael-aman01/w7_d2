class CreateAlbum < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.boolean :studio_album?, null:false, default: true
      t.references :band, null: false, foreign_key: {to_table: :bands}, index: true
      t.string :title, null: false
      t.date :year, null: false
      t.timestamps
    end
    add_index :albums, [:band_id, :title], unique: true 
  end
end
