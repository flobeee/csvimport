class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :recordid
      t.string :fieldname
      t.string :fieldfrom
      t.string :fieldto

      t.timestamps
    end
  end
end
