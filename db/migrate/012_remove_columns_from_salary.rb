class RemoveColumnsFromSalary < ActiveRecord::Migration
  def self.up
     remove_column :salaries, :net_salary
     remove_column :salaries, :ticket
  end

  def self.down
     add_column :salaries, :net_salary, :decimal, :precision => 10, :scale => 2, :default => 0
     add_column :salaries, :ticket , :decimal, :precision => 6, :scale => 2, :default => 0
  end
end
