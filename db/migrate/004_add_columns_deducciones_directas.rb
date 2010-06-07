class AddColumnsDeduccionesDirectas < ActiveRecord::Migration
  def self.up
    add_column :salaries, :cantidad_hijos, :integer,  :default => 0
    add_column :salaries, :otras_cargas, :integer,  :default => 0
    add_column :salaries, :deduce_conyuge, :boolean,  :default => false   
    
  end

  def self.down
    remove_column :salaries, :cantidad_hijos
    remove_column :salaries, :deduce_conyuge
    remove_column :salaries, :otras_cargas
    add_column :salaries, :position_id, :integer, :null => false
  end
end
