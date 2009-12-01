class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :contact
  belongs_to :job
  has_many :invoiceitems
  has_many :payments
  has_and_belongs_to_many :tax
  
  def Invoice.all_owing
    i = Invoice.find_all_by_status("pending")
    total = 0
    i.each do |inv|
      total += inv.invoice_total
    end 
    return total
  end
  
  def invoice_total
    i = Invoice.find(self)
    subtotal = 0
    taxes = 0
    # add up the total of all line items
    i.invoiceitems.collect { |ii| subtotal += ii.unitcost * ii.units }
    # add up the taxes
    i.tax.collect { |t| taxes += subtotal * (t.rate / 100) }
    total = taxes + subtotal
    return total
  end
  
  def invoice_taxes
    i = Invoice.find(self)
    subtotal = 0
    taxes = 0
    # add up the total of all line items
    i.invoiceitems.collect { |ii| subtotal += ii.unitcost * ii.units }
    # add up the taxes
    i.tax.collect { |t| taxes += subtotal * (t.rate / 100) }
    return taxes
  end

end
