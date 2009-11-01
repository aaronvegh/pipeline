class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.references :client
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
