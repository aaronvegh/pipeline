class Job < ActiveRecord::Base
  belongs_to :client
  has_many :tasks
  has_one :estimate
  
  def Job.active_total
    jobs = Job.find_all_by_status("active")
    total = 0
    jobs.collect { |j| total += j.dollar_value }
    return total
  end
  
  def Job.estimates
    prejobs = Job.find_all_by_status("proposed")
    estimates = prejobs.collect { |j| j.estimate }
    return estimates
  end
   
  def Job.estimate_value
    ests = self.estimates
    total = 0
    ests.collect { |e| total += e.dollar_value }
    return total
  end
  
end
