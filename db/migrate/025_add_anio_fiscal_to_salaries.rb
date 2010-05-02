class AddAnioFiscalToSalaries < ActiveRecord::Migration
  def self.up
    add_column :salaries, :anio_fiscal, :integer,  :default => 2008
  end

  def self.down
    remove_column :salaries, :anio_fiscal
  end
end
