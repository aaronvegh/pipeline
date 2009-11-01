class EstimateAddValue < ActiveRecord::Migration
  def self.up
    add_column :estimates, :dollar_value, :float
  end

  def self.down
    remove_column :estimates, :dollar_value
  end
end
