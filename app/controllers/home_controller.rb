class HomeController < ApplicationController
  layout 'layout'
  
  def index
    @current = "home"
    @invoices = Invoice.find_all_by_status("pending")
    @jobs = Job.find_all_by_status("active")
    
    prejobs = Job.find_all_by_status("proposed")
    @estimates = prejobs.collect { |j| j.estimate }
  end
  
end
