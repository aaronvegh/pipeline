class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.integer :job_id
      t.integer :contractor_id
      t.float :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
