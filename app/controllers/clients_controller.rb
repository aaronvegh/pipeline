class ClientsController < ApplicationController
  layout 'layout'
  
  def index
    @current = "clients"
    @clients = Client.find(:all, :order=>"company")
    if params[:id]
      @client = Client.find(params[:id])
      @contacts = @client.contacts
    end
  end
  
  def new 
    render :action => "new", :layout => "popup"
  end
  
  def create
    c = Client.create(params[:client])
    
  end
  
  def edit
    @client = Client.find(params[:id])
    render :action => "edit", :layout=>"popup"
  end
  
  def update
     c = Client.find(params[:client][:id])
     c.update_attributes!(params[:client])
  end
  
  def delete
    c = Client.find(params[:id])
    c.delete
    redirect_to :action=>"index"
  end
  
  def contacts
    @client = Client.find(params[:id])
    @contacts = @client.contacts
  end
  
  def contact_add
    @client = Client.find(params[:id])
    render :action => "contact_add", :layout=>"popup"
  end
  
  def contact_create
    c = Contact.create(params[:contact])
    client = Client.find(params[:client][:id])
    client.contacts << c
    logger.debug "New client: " + params[:contact].inspect
    redirect_to :action=>"index"
  end
    
  def contact_edit
    @contact = Contact.find(params[:id])
    render :action => "contact_edit", :layout=>"popup"
  end
  
  def contact_update
    c = Contact.find(params[:contact][:id])
    c.update_attributes!(params[:contact])
  end
  
end
