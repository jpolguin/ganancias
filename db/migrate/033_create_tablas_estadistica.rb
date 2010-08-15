class CreateTablasEstadistica < ActiveRecord::Migration
  def self.up
         create_table :estadistica_por_rubro_mes do |t|
           t.column  :rubro_empresa, :string  
           t.column  :salario_promedio, :decimal, :precision => 10, :scale => 2, :default => 0
           t.column  :mes, :string  
           t.column  :anio, :string  
         end

         create_table :estadistica_por_cargo_mes do |t|
           t.column  :cargo, :string  
           t.column  :salario_promedio, :decimal, :precision => 10, :scale => 2, :default => 0
           t.column  :mes, :string  
           t.column  :anio, :string  
         end
         


  end

  def self.down
     drop_table :estadistica_por_rubro_mes
     drop_table :estadistica_por_cargo_mes
  
  end
end
