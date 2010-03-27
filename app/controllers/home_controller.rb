class HomeController < ApplicationController
  layout 'layout'
  
  before_filter :valid_user
  
  def index
    @current = "home"
    @invoices = Invoice.find_all_by_status("pending")
    @invoices_60plus = Invoice.invoices_60plus
    @invoices_30plus = Invoice.invoices_30plus
    @invoices_0plus = Invoice.invoices_0plus
    @jobs = Job.find_all_by_status("active")
    
    prejobs = Job.find_all_by_status("proposed")
    @estimates = prejobs.collect { |j| j.estimate }
  end
  
end
