class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title
      t.string :author
      t.string :pdf_file

      t.timestamps
    end
  end
end
