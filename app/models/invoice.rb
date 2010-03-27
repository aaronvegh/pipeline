class Invoice < ActiveRecord::Base
  include ApplicationHelper
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
      total += Payment.balance_outstanding(inv)
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
  
  def Invoice.invoices_60plus
    invoices = Invoice.find_all_by_status("pending")
    returning_invoices = Array.new
    invoices.each do |i|
      now = Date.today
      days_since_date = now - i.invoice_date.to_date
      if days_since_date >= 60
        returning_invoices << i
      end
    end
    return returning_invoices
  end
  
  def Invoice.invoices_30plus
    invoices = Invoice.find_all_by_status("pending")
    returning_invoices = Array.new
    invoices.each do |i|
      now = Date.today
      days_since_date = now - i.invoice_date.to_date
      if days_since_date >= 30 && days_since_date < 60
        returning_invoices << i
      end
    end
    return returning_invoices
  end
  
  def Invoice.invoices_0plus
    invoices = Invoice.find_all_by_status("pending")
    returning_invoices = Array.new
    invoices.each do |i|
      now = Date.today
      days_since_date = now - i.invoice_date.to_date
      if days_since_date < 30
        returning_invoices << i
      end
    end
    return returning_invoices
  end

end
