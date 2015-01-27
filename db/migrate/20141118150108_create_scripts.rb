class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title
      t.string :author
      t.string :filepath
      t.text :script_contents

      t.timestamps
    end
  end
end
