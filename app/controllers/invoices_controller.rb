class InvoicesController < ApplicationController
  layout 'layout'
  require 'prawn/layout'
  
  def index
    @current = "invoices"
    @invoices = Invoice.find(:all)
    @taxes = Tax.find(:all)
    if params[:id]
      @active = Invoice.find(params[:id])
    end
  end
  
  def show
    @invoice = Invoice.find(params[:id])
  end
  
  def new 
    @clients = Client.find(:all)
    @iitem = Invoiceitem.create()
    @taxes = Tax.find(:all)
    render :action => "new", :layout => "popup"
  end
  
  def create
    @i = Invoice.create(:invoice_date=>params[:invoice_date], :status=>"pending")
    @i.client = Client.find(params[:client][:id])
    @i.contact = Contact.find(params[:contact][:id])
    @i.job = Job.find(params[:job][:id])
    
    # assemble invoice items
   
    params[:iitem].each_key do |ii|
      invitem = Invoiceitem.find(ii)
      invitem.update_attributes(params[:iitem][ii])
      @i.invoiceitems << invitem
    end
    
    # assemble taxes
    if params[:tax]
      params[:tax].each do |t|
        tax = Tax.find(t)
        @i.tax << tax
      end
    end
    
    @i.save
  
  end
  
  def delete
    inv = Invoice.find(params[:id])
    inv.delete
    redirect_to :action=>"index"
  end
  
  def update
    logger.debug "Got an invoice."
    @i = Invoice.find(params[:id])
    @i.status = params[:invoice][:status]
    @i.invoice_date = params[:invoice][:invoice_date]
    @i.client = Client.find(params[:client][:id])
    @i.contact = Contact.find(params[:contact][:id])
    @i.job = Job.find(params[:job][:id])
    
    # assemble invoice items
   if params[:iitem]
    params[:iitem].each_key do |ii|
      invitem = Invoiceitem.find(ii)
      invitem.update_attributes(params[:iitem][ii])
      @i.invoiceitems << invitem
    end
  end
    
    # assemble taxes
    @i.tax.delete_all
    
    if params[:tax]
      params[:tax].each do |t|
        tax = Tax.find(t)
        @i.tax << tax
      end
    end
    @i.save  
    
  end
  
  def edit
    @invoice = Invoice.find(params[:id])
    @taxes = Tax.find(:all)
    render :action=>"edit", :layout => "popup"
  end
  
  def choose_client
    @contacts = Contact.find_all_by_client_id(params[:client][:id])
    @jobs = Job.find_all_by_client_id(params[:client][:id])
  end
  
  def new_invoice_item
    @iitem = Invoiceitem.create()
  end
  
  def print
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.pdf
    end
  end
  
  def remove_invoiceitem
    @iitem = params[:id]
    invoice = Invoiceitem.find(@iitem).invoice
    invoice.invoiceitems.delete(Invoiceitem.find(@iitem))    
  end
    
  def tax_create
    tax = Tax.create(params[:tax])
    redirect_to :action=>"index"
  end
  
  def tax_update
    tax = Tax.find(params[:tax][:id])
    tax.update_attributes!(params[:tax])
    redirect_to :action=>"index"
  end
  
  def tax_delete
    tax = Tax.find(params[:id])
    tax.delete
    redirect_to :action=>"index"
  end
  
  
  
end
