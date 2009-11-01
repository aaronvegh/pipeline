class InvoicesTaxes < ActiveRecord::Migration
  def self.up
    create_table :invoices_taxes, :id=>false do |t|
      t.integer :invoice_id
      t.integer :tax_id
    end
  end

  def self.down
    drop_table :invoices_taxes
  end
end
