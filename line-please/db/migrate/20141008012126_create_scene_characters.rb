class CreateSceneCharacters < ActiveRecord::Migration
  def change
    create_table :scene_characters do |t|
      t.references :scene
      t.references :character

      t.timestamps
    end
  end
end
