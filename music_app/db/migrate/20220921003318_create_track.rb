class CreateTrack < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.string :lyrics, null: true
      t.references :album, null: false, foreign_key: {to_table: :albums}
      
      t.boolean :bonus, null: false, default: true
      t.timestamps
    end
    add_index :tracks, [:album_id,:ord], unique: true
  end
end
