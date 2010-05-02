class CreateSalaries < ActiveRecord::Migration
  def self.up
    create_table :salaries do |t|
      t.column :net_salary, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :ticket , :decimal, :precision => 6, :scale => 2, :default => 0
      t.column :position_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :salaries
  end
end
