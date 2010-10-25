class ContractAddPaid < ActiveRecord::Migration
  def self.up
    add_column :contracts, :paid, :float
  end

  def self.down
    remove_column :contracts, :paid
  end
end
