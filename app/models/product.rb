class Product < ActiveRecord::Base
  require 'csv'
  require 'rest-client'

  def self.import(file, export, site, credentials, object, fieldname, fieldto)
    CSV.foreach(file.path, headers: true) do |row|

      product_hash = row.to_hash # exclude the price field
      product = Product.where(id: product_hash["id"])

      if product.count == 1
        product.first.update_attributes(product_hash)
      else
        #Inserting the data
        Product.create!(product_hash)

        #Constructing API URL

        Product.last.update(object: object)

        if Product.last.object == "1"
          siteendpoint = "/api/invoices/" + Product.last.recordid.to_s + "?return_object=limited"
          messagebegin = "<invoice-header>"
          messageend = "</invoice-header>"
        elsif Product.last.object == "2"
          siteendpoint = "/api/purchase_orders/" + Product.last.recordid.to_s + "?return_object=limited"
          messagebegin = "<order-header>"
          messageend = "</order-header>"
        elsif Product.last.object == "3"
          siteendpoint = "/api/expense_reports/" + Product.last.recordid.to_s + "?return_object=limited"
          messagebegin = "<expense-header>"
          messageend = "</expense-header>"
        else
          puts "No Object Sent"
        end

        Product.last.update(site: site)

        constructedurl = Product.last.site + siteendpoint

        #Headers construction using credentials
        headerpass = credentials
        headeraccept = "application/xml"

        #If a field is changing then add more to the mesaging.
        if Product.last.fieldname.length > 2 && Product.last.fieldto.length > 2
          fieldpayload = "<" + Product.last.fieldname + ">" + Product.last.fieldto + "</" + Product.last.fieldname + ">"
        else
          fieldpayload = ""
        end

        #Exporting and sending the desired payload
        Product.last.update(export: export)
        if Product.last.export == "0"
          RestClient.put(constructedurl, messagebegin+"<exported>false</exported>"+fieldpayload+messageend, {:X_COUPA_API_KEY => headerpass, :Accept => headeraccept} )
        elsif Product.last.export == "1"
          RestClient.put(constructedurl, messagebegin+"<exported>true</exported>"+fieldpayload+messageend, {:X_COUPA_API_KEY => headerpass, :Accept => headeraccept} )
        elsif fieldpayload != ""
          RestClient.put(constructedurl, messagebegin+fieldpayload+messageend, {:X_COUPA_API_KEY => headerpass, :Accept => headeraccept} )
        else
          puts "No exported flag sent or payload" + Product.last.export
        end
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file, export)
end # end class
