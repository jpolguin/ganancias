class CreateSpecialDiscounts < ActiveRecord::Migration
  def self.up
    create_table :special_discounts do |t|
      
      t.column :month, :string 
      t.column :seguro_retiro, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :seguro_vida, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :cuota_medica, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :donacion, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :honorario_medico, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :intereses_hipotecarios, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :personal_domestico, :decimal, :precision => 10, :scale => 2, :default => 0
      t.column :aportes_voluntarios_afjp, :decimal, :precision => 10, :scale => 2, :default => 0
    end
  end

  def self.down
    drop_table :special_discounts
  end
end
