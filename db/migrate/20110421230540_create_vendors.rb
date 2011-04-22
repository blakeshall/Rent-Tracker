class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
        t.string :name
        t.integer :booth
        t.decimal :amount
        t.boolean :weekly
        t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
