class AddColumnsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :site, :string
    add_column :products, :credentials, :string
    add_column :products, :export, :string
    add_column :products, :running, :string
  end
end
