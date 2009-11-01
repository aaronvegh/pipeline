class CreateEstimates < ActiveRecord::Migration
  def self.up
    create_table :estimates do |t|
      t.references :job
      t.string :title
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :estimates
  end
end
