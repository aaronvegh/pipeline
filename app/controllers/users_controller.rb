class UsersController < ApplicationController
  layout 'layout' 
  
  def login
    
  end
  
  def login_attempt
    if request.post?
      
      if params[:users][:username] == "aaron" && params[:users][:password] == "cor318"
        logger.debug "Attempting..."
        session[:valid_user] = "true"
        redirect_to :controller=>"home", :action=>"index"
      else 
        flash[:error] = "Login incorrect!"
        redirect_to :action=>"login"
      end      
    end
  end
  
end
