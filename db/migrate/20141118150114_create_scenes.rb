class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.references :script
      t.string :header

      t.timestamps
    end
  end
end
