class ActualizarDeduccionesMniJulio2007 < ActiveRecord::Migration
  def self.up
    RevenueParameter.update_all "value = 10800", "name = 'MINIMO_NO_IMPONIBLE' and year=2008"
    RevenueParameter.update_all "value = 12000", "name = 'CONYUGE' and year=2008"
    RevenueParameter.update_all "value = 6000", "name = 'HIJO' and year=2008"
    RevenueParameter.update_all "value = 4500", "name = 'OTRAS_CARGAS' and year=2008"
    RevenueParameter.update_all "value = 51840", "name = 'DEDUCCION_ESPECIAL' and year=2008"
  end

  def self.down
    RevenueParameter.update_all "value = 9000", "name = 'MINIMO_NO_IMPONIBLE' and year=2008"
    RevenueParameter.update_all "value = 10000", "name = 'CONYUGE' and year=2008"
    RevenueParameter.update_all "value = 5000", "name = 'HIJO' and year=2008"
    RevenueParameter.update_all "value = 3750", "name = 'OTRAS_CARGAS' and year=2008"
    RevenueParameter.update_all "value = 43200", "name = 'DEDUCCION_ESPECIAL' and year=2008"
  end
end

