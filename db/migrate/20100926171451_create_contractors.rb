class CreateContractors < ActiveRecord::Migration
  def self.up
    create_table :contractors do |t|
      t.string :fname
      t.string :lname
      t.string :company
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :contractors
  end
end
