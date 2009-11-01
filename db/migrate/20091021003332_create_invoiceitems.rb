class CreateInvoiceitems < ActiveRecord::Migration
  def self.up
    create_table :invoiceitems do |t|
      t.references :invoice
      t.string :item
      t.string :description
      t.float :unitcost
      t.float :units
      t.timestamps
    end
  end

  def self.down
    drop_table :invoiceitems
  end
end
