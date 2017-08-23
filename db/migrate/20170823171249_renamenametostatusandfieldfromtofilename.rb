class Renamenametostatusandfieldfromtofilename < ActiveRecord::Migration[5.0]
  def change
      rename_column :products, :name, :filename
      rename_column :products, :fieldfrom, :status
  end
end
