class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :text
      t.references :character_scene

      t.timestamps
    end
  end
end
