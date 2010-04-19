module InvoicesHelper
  
  def invoices_sum(invoices)
    sum = 0
    invoices.each do |i|
      sum += Payment.balance_outstanding(i)
    end
    return sum
  end
end
