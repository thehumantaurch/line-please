class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.text :words
      t.references :scene_character

      t.timestamps
    end
  end
end
