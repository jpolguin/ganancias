class CreateRevenueTaxes < ActiveRecord::Migration
  def self.up
    create_table :revenue_taxes do |t|
        t.column :month, :string
        t.column :from_salary, :decimal, :precision => 12, :scale => 2, :default => 0
        t.column :to_salary, :decimal, :precision => 12, :scale => 2, :default => 0
        t.column :tax_amount, :decimal, :precision => 12, :scale => 2, :default => 0
        t.column :tax_rate, :decimal, :precision => 8, :scale => 2, :default => 0

    end
  end

  def self.down
    drop_table :revenue_taxes
  end
end
