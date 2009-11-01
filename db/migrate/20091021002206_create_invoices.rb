class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.references :client
      t.references :contact
      t.references :job
      t.datetime :invoice_date
      t.string :status # pending || paid
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
