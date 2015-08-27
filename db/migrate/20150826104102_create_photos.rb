class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :src
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height
      t.integer :degree
      t.integer :z
      t.boolean :sepia
      t.float :desaturate
      t.integer :contrast
      t.references :collage, index: true

      t.timestamps
    end
  end
end
