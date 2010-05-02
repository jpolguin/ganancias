class CreateMonthlySalaries < ActiveRecord::Migration
  def self.up
    create_table :monthly_salaries do |t|
      t.column :month, :string 
      t.column :gross_salary, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :ticket , :decimal, :precision => 6, :scale => 2, :default => 0
      t.column :bonus , :decimal, :precision => 10, :scale => 2, :default => 0
      
    end
  end

  def self.down
    drop_table :monthly_salaries
  end
end
