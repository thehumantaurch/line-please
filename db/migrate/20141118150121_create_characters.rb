class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :script
      t.string :name

      t.timestamps
    end
  end
end
