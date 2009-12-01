class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :invoice_id
      t.date :payment_date
      t.float :payment_amount
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
