class InsertRevenueParametersDetailsIni < ActiveRecord::Migration
  def self.up
    
    parametro_porcentaje_obra_social = RevenueParameter.find(:all, :conditions => "name = 'PORCENTAJE_DESCUENTO_OBRA_SOCIAL_Y_LEY' ")
    for mes in Salary::MONTHS
      RevenueParameterDetail.create(:month => mes, :value => 0.06, :revenue_parameter_id => parametro_porcentaje_obra_social[0].id)
    end
    
    parametro_porcentaje_jubilacion =   RevenueParameter.find(:all, :conditions => "name = 'PORCENTAJE_DESCUENTO_JUBILACION' ")
    
    for mes in Salary::MONTHS
      RevenueParameterDetail.create(:month => mes, :value => 0.07, :revenue_parameter_id => parametro_porcentaje_jubilacion[0].id)
    end
    
    parametro_tope_obra_social =  RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_OBRA_SOCIAL' ")
    
    for mes in Salary::MONTHS
      RevenueParameterDetail.create(:month => mes, :value => 4800.0, :revenue_parameter_id => parametro_tope_obra_social[0].id)
    end

    parametro_tope_jubilacion = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_JUBILACION' ")

    for mes in Salary::MONTHS
      RevenueParameterDetail.create(:month => mes, :value => 6000.0, :revenue_parameter_id => parametro_tope_jubilacion[0].id)
    end
    
  end

  def self.down
    RevenueParameterDetail.delete_all 
  end
end
