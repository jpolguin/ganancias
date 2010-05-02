class ActualizDeducNov2008 < ActiveRecord::Migration
  def self.up
    RevenueParameter.update_all "value = 43200", "name = 'DEDUCCION_ESPECIAL' and year=2008"
    
    parametro_tope_obra_social =  RevenueParameter.find(:first, :conditions => "name = 'SUELDO_TOPE_PARA_OBRA_SOCIAL' ")          
    tope_noviembre = RevenueParameterDetail.find :first, :conditions => ["revenue_parameter_id =:tope and month =:mes",{:tope => parametro_tope_obra_social.id,:mes=>:noviembre} ]
    tope_diciembre = RevenueParameterDetail.find :first, :conditions => ["revenue_parameter_id =:tope and month =:mes",{:tope => parametro_tope_obra_social.id,:mes=>:diciembre} ]
    RevenueParameterDetail.update tope_noviembre.id, {:value => 7800}
    RevenueParameterDetail.update tope_diciembre.id, {:value => 7800}
    
   # RevenueParameterDetail.update  ":value => 7800.0", "revenue_parameter_id = ':tope' and month=':mes',{:tope => parametro_tope_obra_social[0].id, :mes=>:noviembre} )
    #RevenueParameterDetail.update_all ":value => 7800.0", "revenue_parameter_id = ':tope' and month=':mes',{:tope => parametro_tope_obra_social[0].id, :mes=>:diciembre} )
  end

  def self.down
    RevenueParameter.update_all "value = 36000", "name = 'DEDUCCION_ESPECIAL' and year=2008"
    
    parametro_tope_obra_social =  RevenueParameter.find(:first, :conditions => "name = 'SUELDO_TOPE_PARA_OBRA_SOCIAL' ")          
    tope_noviembre = RevenueParameterDetail.find :first, :conditions => ["revenue_parameter_id =:tope and month =:mes",{:tope => parametro_tope_obra_social.id,:mes=>:noviembre} ]
    tope_diciembre = RevenueParameterDetail.find :first, :conditions => ["revenue_parameter_id =:tope and month =:mes",{:tope => parametro_tope_obra_social.id,:mes=>:diciembre} ]
    RevenueParameterDetail.update tope_noviembre.id, {:value => 4800}
    RevenueParameterDetail.update tope_diciembre.id, {:value => 4800}

  end
end
