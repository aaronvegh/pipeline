class InvoicesAddNumber < ActiveRecord::Migration
  def self.up
    add_column :invoices, :invoice_number, :integer
  end

  def self.down
    remove_column :invoices, :invoice_number
  end
end
