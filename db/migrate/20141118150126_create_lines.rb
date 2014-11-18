class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.references :character
      t.string :text

      t.timestamps
    end
  end
end
