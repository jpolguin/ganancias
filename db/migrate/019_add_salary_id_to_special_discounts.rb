class AddSalaryIdToSpecialDiscounts < ActiveRecord::Migration
  def self.up
    add_column :special_discounts, :salary_id, :integer,  :null => false
  end

  def self.down
    remove_column :special_discounts, :salary_id
  end
end
