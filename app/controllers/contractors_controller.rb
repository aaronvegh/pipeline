class ContractorsController < ApplicationController
  layout 'layout'
  
  def index
    @current = "contractors"
    @contractors = Contractor.find(:all, :order=>"lname")
    if params[:id]
      @contractor = Contractor.find(params[:id])
    end
  end
  
  def new 
    render :action => "new", :layout => "popup"
  end
  
  def create
    c = Contractor.create(params[:contractor])
    
  end
  
  def edit
    @contractor = Contractor.find(params[:id])
    render :action => "edit", :layout=>"popup"
  end
  
  def update
     c = Contractor.find(params[:contractor][:id])
     c.update_attributes!(params[:contractor])
  end
  
  def delete
    c = Contractor.find(params[:id])
    c.delete
    redirect_to :action=>"index"
  end
  
  def contracts
    @contractor = Contractor.find(params[:id])
    @contracts = @contractor.contracts
  end
  
end
