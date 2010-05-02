class CreateRevenueParameterDetails < ActiveRecord::Migration
  def self.up
    create_table :revenue_parameter_details do |t|
              t.column :month, :string
              t.column :value, :decimal, :precision => 10, :scale => 2, :default => 0
              t.column :revenue_parameter_id, :integer,  :null => false
    end
  end

  def self.down
    drop_table :revenue_parameter_details
  end
end
