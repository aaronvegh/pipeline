class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.references :client
      t.references :estimate
      t.text :description
      t.string :status # "proposed" || "active" || "completed" || "limbo"
      t.float :dollar_value
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
