class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :company
      t.string :street1
      t.string :street2
      t.string :city
      t.string :province
      t.string :postal
      t.string :country
      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
