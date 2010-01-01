i = @invoice
l = i.invoiceitems

	company_logo = RAILS_ROOT+"/public/images/inno_document_bg.png"
	pdf.image company_logo, 
	    :at  => [-35,756], 
	    :fit=>Prawn::Document::SIZES["LETTER"]
	    
	    
	pdf.bounding_box [320,600], :width=>200 do 
	   pdf.text "Invoice ##{i.id}", :align=>:right, :size=>16, :style=>:bold
	   pdf.text "#{i.invoice_date.strftime("%B %d, %Y")}", :align=>:right
  end

	pdf.bounding_box [0, 600], :width=>200 do
	  pdf.text "Invoice for:", :align=>:left, :style=>:bold
  	pdf.text "#{i.contact.fname} #{i.contact.lname}", :align=>:left
  	pdf.text "#{i.client.company}", :align=>:left
  	if i.client.street1 != ""
  	  pdf.text "#{i.client.street1}", :align=>:left
  	  pdf.text "#{i.client.city}, #{i.client.province}   #{i.client.postal}", :align=>:left
  	end
  end

	subtotal = 0

	data = Array.new
	l.each do |li|
	subtotal += li.unitcost * li.units
	data.push [li.item, li.description, li.units, format_currency(li.unitcost)]
	end

	pdf.move_down 30

	pdf.table data,
	:position => :left,
	:headers => ["Item", "Description", "Quantity", "Unit Price"],
	:column_widths => { 0 => 120, 1 => 270, 2 => 60, 3 => 70},
	:align => { 2 => :right, 3 => :right},
	:border_style => :all,
	:header_color => 'C3E47D',
	:header_text_color  => "000000",
	:row_colors => ["eeeeee","efefef"]

	pdf.move_down 20

	taxes = i.invoice_taxes
	grand_total = i.invoice_total

	totals = [ ["Subtotal", format_currency(subtotal)],
	        ["Taxes", format_currency(taxes)],
	        ["Total", format_currency(grand_total)]]
        
	pdf.table totals,
	:position => 390,
	:column_widths => { 0 => 60, 1 => 70},
	:align => {1=>:right},
	:border_style => :all,
	:header_color => 'efefef',
	:header_text_color  => "000000",
	:row_colors => ["eeeeee","efefef"]
	
