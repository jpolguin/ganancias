class CreateComparacionSueldos < ActiveRecord::Migration
  def self.up
     create_table :comparacion_sueldos do |t|
      t.column :salario_bruto_actual, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :salario_bruto_futuro, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :ticket_actual , :decimal, :precision => 6, :scale => 2, :default => 0
      t.column :ticket_futuro, :decimal, :precision => 6, :scale => 2, :default => 0
      t.column :bonus_actual , :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :bonus_futuro, :decimal, :precision => 10, :scale => 2, :default => 0
      
     t.column  :cantidad_hijos, :integer,  :default => 0
     t.column :otras_cargas, :integer,  :default => 0
     t.column :deduce_conyuge, :boolean,  :default => false   
     
      
    end
  end

  def self.down
     drop_table :comparacion_sueldos
  end
end
