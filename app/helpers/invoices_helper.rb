module InvoicesHelper
  
  def invoices_sum(invoices)
    sum = 0
    invoices.each do |i|
      sum += i.invoice_total
    end
    return sum
  end
end
