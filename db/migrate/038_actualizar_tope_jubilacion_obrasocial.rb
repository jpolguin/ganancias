class ActualizarTopeJubilacionObrasocial < ActiveRecord::Migration
  def self.up
    parametro_tope_jubilacion = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_JUBILACION' ")
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and ( month like '%enero%' or month like '%febrero%') " 
    RevenueParameterDetail.update_all "value=13878.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and (month like '%marzo%' or month like '%abril%' or month like '%mayo%' or month like '%junio%')" 
    RevenueParameterDetail.update_all "value=13878.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and (month like '%julio%' or month like '%agosto%' or month like '%septiembre%' or month like '%octubre%' or month like '%noviembre%' or month like '%diciembre%') " 
   
    parametro_tope_obrasocial = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_OBRA_SOCIAL' ")
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_obrasocial[0].id} and ( month like '%enero%' or month like '%febrero%') " 
    RevenueParameterDetail.update_all "value=13878.0", "revenue_parameter_id=#{parametro_tope_obrasocial[0].id} and (month like '%marzo%' or month like '%abril%' or month like '%mayo%' or month like '%junio%')" 
    RevenueParameterDetail.update_all "value=13878.0", "revenue_parameter_id=#{parametro_tope_obrasocial[0].id} and (month like '%julio%' or month like '%agosto%' or month like '%septiembre%' or month like '%octubre%' or month like '%noviembre%' or month like '%diciembre%') " 
  end

  def self.down
    parametro_tope_jubilacion = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_JUBILACION' ")
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and ( month like '%enero%' or month like '%febrero%') " 
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and (month like '%marzo%' or month like '%abril%' or month like '%mayo%' or month like '%junio%')" 
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_jubilacion[0].id} and (month like '%julio%' or month like '%agosto%' or month like '%septiembre%' or month like '%octubre%' or month like '%noviembre%' or month like '%diciembre%') " 
   
    parametro_tope_obrasocial = RevenueParameter.find(:all, :conditions => "name = 'SUELDO_TOPE_PARA_OBRA_SOCIAL' ")
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_obrasocial[0].id} and ( month like '%enero%' or month like '%febrero%') " 
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_obrasocial[0].id} and (month like '%marzo%' or month like '%abril%' or month like '%mayo%' or month like '%junio%')" 
    RevenueParameterDetail.update_all "value=11829.0", "revenue_parameter_id=#{parametro_tope_obrasocial[0].id} and (month like '%julio%' or month like '%agosto%' or month like '%septiembre%' or month like '%octubre%' or month like '%noviembre%' or month like '%diciembre%') " 
  end
end
