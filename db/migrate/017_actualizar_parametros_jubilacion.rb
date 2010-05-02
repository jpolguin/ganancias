class ActualizarParametrosJubilacion < ActiveRecord::Migration
  def self.up
    
    parametro_porcentaje_jubilacion =   RevenueParameter.find(:all, :conditions => "name = 'PORCENTAJE_DESCUENTO_JUBILACION' ")    
    RevenueParameterDetail.update_all "value=0.11", "revenue_parameter_id=#{parametro_porcentaje_jubilacion[0].id}"  
    
    parametro_tope_jubilacion = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_JUBILACION' ")
    RevenueParameterDetail.update_all "value=6750.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and ( month like '%enero%' or month like '%febrero%') " 
    RevenueParameterDetail.update_all "value=7256.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and (month like '%marzo%' or month like '%abril%' or month like '%mayo%' or month like '%junio%')" 
    RevenueParameterDetail.update_all "value=7800.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and (month like '%julio%' or month like '%agosto%' or month like '%septiembre%' or month like '%octubre%' or month like '%noviembre%' or month like '%diciembre%') " 
    
  end

  def self.down
    
    parametro_porcentaje_jubilacion =   RevenueParameter.find(:all, :conditions => "name = 'PORCENTAJE_DESCUENTO_JUBILACION' ")    
    RevenueParameterDetail.update_all "value=0.07", "revenue_parameter_id=#{parametro_porcentaje_jubilacion[0].id}"  
    
    parametro_tope_jubilacion = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_JUBILACION' ")
    RevenueParameterDetail.update_all "value=6000.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} " 
    
  end
end
