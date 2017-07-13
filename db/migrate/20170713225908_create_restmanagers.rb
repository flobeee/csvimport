class CreateRestmanagers < ActiveRecord::Migration[5.0]
  def change
    create_table :restmanagers do |t|
      t.string :site
      t.string :credentials
      t.string :export
      t.string :running

      t.timestamps
    end
  end
end
