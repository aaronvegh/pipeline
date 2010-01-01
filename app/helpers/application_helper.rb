# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def job_statuses
    [
      ["Proposed","proposed"],
      ["Active","active"], 
      ["Completed","completed"], 
      ["Limbo","limbo"]
    ]
  end
  
  def days_since_date(time)
    now = Date.today
    difference = now - time
    return difference.to_i
  end
  
  def format_currency(number)
		number_to_currency(number, :delimiter => ",", :unit => "$",:separator => ".")
	end
	
	def format_currency_short(number)
		return "$"+number.to_i.to_s
	end
	
	def line_break(string)
    	string.gsub("\n", '<br/>')
	end
  
end
