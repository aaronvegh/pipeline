class Contractor < ActiveRecord::Base
  has_many :contracts
  
  def contract_total 
    total = 0
    self.contracts.each do |c|
      total += c.amount
    end
    return total
  end
  
end
