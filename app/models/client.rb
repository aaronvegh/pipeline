class Client < ActiveRecord::Base
  has_many :invoices
  has_many :jobs
  has_many :contacts
  
  def billed_total
    c = Client.find(self)
    inv = c.invoices
    total = 0
    inv.each do |i|
      total += i.invoice_total
    end
    return total
  end
  
  def outstanding
    c = Client.find(self)
    inv = c.invoices.find_all_by_status("pending")
    total = 0
    inv.each do |i|
      total += i.invoice_total
    end
    return total
  end
  
  def short_company_name(len=10)
    self.company.size > len ? self.company[0..len] + "..." : self.company
  end
  
end
