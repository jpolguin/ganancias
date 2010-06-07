class AddCargoRubroExperienciaToSalary < ActiveRecord::Migration
  def self.up
     add_column :salaries,:rubro_empresa, :string  
     add_column :salaries,:cargo, :string
     add_column :salaries,:experiencia, :integer,  :default => 0 
     add_column :salaries,:fecha_calculo, :date
     remove_column :salaries, :position_id
  end

  def self.down
    remove_column :salaries, :rubro_empresa
    remove_column :salaries, :cargo
    remove_column :salaries, :experiencia
    remove_column :salaries, :fecha_calculo
    add_column :salaries,:position_id, :integer, :null => false
  end
end
