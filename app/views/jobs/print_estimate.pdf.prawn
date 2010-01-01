company_logo = RAILS_ROOT+"/public/images/inno_document_bg.png"
pdf.image company_logo, 
    :at  => [-35,756], 
    :fit=>Prawn::Document::SIZES["LETTER"]


pdf.text "Estimate Date: #{Time.now.strftime("%B %d, %Y")}", :at=>[350,600]
pdf.bounding_box([5,580], :width=>500) do
  pdf.text @estimate.title, :size=>16
  pdf.text @estimate.content
end