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
  
end
