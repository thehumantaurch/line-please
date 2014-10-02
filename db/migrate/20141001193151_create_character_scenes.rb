class CreateCharacterScenes < ActiveRecord::Migration
  def change
    create_table :character_scenes do |t|
      t.references :scene
      t.references :character

      t.timestamps
    end
  end
end
