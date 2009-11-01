class Contact < ActiveRecord::Base
  belongs_to :client
  
  def fullname
    return self.fname + " " + self.lname
  end
end
