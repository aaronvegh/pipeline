class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.references :job
      t.string :task
      t.string :status_flag # "open" || "completed"
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
