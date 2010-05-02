class InsertRevenueParameters < ActiveRecord::Migration
  def self.up
    RevenueParameter.create(:year => 2008, :name =>"MINIMO_NO_IMPONIBLE"  , :value => 7500.0  , :has_detail => false)
    RevenueParameter.create(:year => 2008, :name =>"DEDUCCION_ESPECIAL"  , :value => 36000.0  , :has_detail => false)
    RevenueParameter.create(:year => 2008, :name =>"CONYUGE"  , :value => 8000.0  , :has_detail => false)
    RevenueParameter.create(:year => 2008, :name =>"HIJO"  , :value => 4000.0  , :has_detail => false)
    RevenueParameter.create(:year => 2008, :name =>"OTRAS_CARGAS"  , :value => 3000.0  , :has_detail => false)
    
    RevenueParameter.create(:year => 2008, :name =>"PORCENTAJE_DESCUENTO_OBRA_SOCIAL_Y_LEY"  , :value => 0  , :has_detail => true)
    RevenueParameter.create(:year => 2008, :name =>"SUELDO_TOPE_PARA_OBRA_SOCIAL"            , :value => 0  , :has_detail => true)
    RevenueParameter.create(:year => 2008, :name =>"SUELDO_TOPE_PARA_JUBILACION"             , :value => 0  , :has_detail => true)
    RevenueParameter.create(:year => 2008, :name =>"PORCENTAJE_DESCUENTO_JUBILACION"         , :value => 0  , :has_detail => true)
    
    
    
    
  end

  def self.down
    RevenueParameter.delete_all
    
  end
end
