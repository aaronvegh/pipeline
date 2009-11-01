company_logo = RAILS_ROOT+"/public/images/innoveghtive.png"
pdf.image company_logo, :at=>[0,720]

pdf.text "Invoice ##{i.id}", :at=>[350,700]
pdf.text "Invoice for: #{i.client.company}", :at=>[350,685]
pdf.text "Invoice Date: #{Time.now.strftime("%B %d, %Y")}", :at=>[350,670]