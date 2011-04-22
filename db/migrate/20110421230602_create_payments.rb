class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.belongs_to :vendor
      t.decimal :amount
      t.timestamp :paid_at
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
