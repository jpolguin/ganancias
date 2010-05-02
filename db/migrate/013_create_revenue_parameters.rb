class CreateRevenueParameters < ActiveRecord::Migration
  def self.up
    create_table :revenue_parameters do |t|
      t.column :year , :integer
      t.column :name, :string
      t.column :value, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :has_detail, :boolean, :default => false
    end
  end

  def self.down
    drop_table :revenue_parameters
  end
end
