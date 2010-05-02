class AddSalaryIdToMonthlySalary < ActiveRecord::Migration
  def self.up
    add_column :monthly_salaries, :salary_id, :integer,  :null => false
  end

  def self.down
    remove_column :monthly_salaries, :salary_id
  end
end
