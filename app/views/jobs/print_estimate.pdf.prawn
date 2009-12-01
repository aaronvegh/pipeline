company_logo = RAILS_ROOT+"/public/images/innoveghtive.png"
pdf.image company_logo, :at=>[0,720]

pdf.text "Estimate Date: #{Time.now.strftime("%B %d, %Y")}", :at=>[350,670]
pdf.bounding_box([5,630], :width=>500) do
  pdf.text @estimate.title, :size=>16
  pdf.text @estimate.content
end