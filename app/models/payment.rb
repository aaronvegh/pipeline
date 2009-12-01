class Payment < ActiveRecord::Base
  belongs_to :invoice
  
  def Payment.payments_total(invoice)
    i = Invoice.find(invoice)
    payments = 0
    i.payments.each { |p| payments += p.payment_amount }
    return payments
  end
  
  def Payment.balance_outstanding(invoice)
    i = Invoice.find(invoice)
    total = i.invoice_total
    payments = 0
    i.payments.each { |p| payments += p.payment_amount }
    return total - payments
  end
end
