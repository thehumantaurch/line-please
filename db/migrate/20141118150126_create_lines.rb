class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.references :character
      t.text :text

      t.timestamps
    end
  end
end
