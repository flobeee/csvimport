class RenameRunningToObject < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :running, :object
  end
end
