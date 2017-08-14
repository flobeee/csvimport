class Product < ActiveRecord::Base
  require 'csv'

  def self.import(file, export)
    CSV.foreach(file.path, headers: true) do |row|

      product_hash = row.to_hash # exclude the price field
      product = Product.where(id: product_hash["id"])

      if product.count == 1
        product.first.update_attributes(product_hash)
      else
        Product.create!(product_hash)
        Product.last.update(export: export)
        if Product.last.export == "yes"
          puts "The answer is YES!"
        end
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file, export)
end # end class
