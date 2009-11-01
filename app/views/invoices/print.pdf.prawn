i = @invoice
l = i.invoiceitems

	company_logo = RAILS_ROOT+"/public/images/innoveghtive.png"
	pdf.image company_logo, :at=>[0,720]

	pdf.text "Invoice ##{i.id}", :at=>[350,700]
	pdf.text "Invoice for: #{i.client.company}", :at=>[350,685]
	pdf.text "Invoice Date: #{Time.now.strftime("%B %d, %Y")}", :at=>[350,670]

	subtotal = 0

	data = Array.new
	l.each do |li|
	subtotal += li.unitcost * li.units
	data.push [li.item, li.description, li.units, "$"+sprintf("%.02f", li.unitcost)]
	end

	pdf.move_down 80

	pdf.table data,
	:position => :left,
	:headers => ["Item", "Description", "Quantity", "Unit Price"],
	:column_widths => { 0 => 120, 1 => 270, 2 => 60, 3 => 70},
	:border_style => :grid,
	:header_color => 'efefef',
	:header_text_color  => "000000",
	:row_colors => ["999999","aaaaaa"]

	pdf.move_down 20

	taxes = i.invoice_taxes
	grand_total = i.invoice_total

	totals = [ ["Subtotal", "$"+sprintf("%.02f", subtotal)],
	        ["Taxes", "$"+sprintf("%.02f", taxes)],
	        ["Total", "$"+sprintf("%.02f", grand_total)]]
        
	pdf.table totals,
	:position => 350,
	:column_widths => { 0 => 100, 1 => 70},
	:border_style => :grid,
	:header_color => 'efefef',
	:header_text_color  => "000000",
	:row_colors => ["999999","aaaaaa"]
	
