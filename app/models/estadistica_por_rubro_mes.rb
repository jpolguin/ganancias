class EstadisticaPorRubroMes < ActiveRecord::Base
  
  def self.find_estadisticas_mes(mes, anio)
    EstadisticaPorRubroMes.find(:all,
                  :conditions => "mes = '" + mes + "' and anio = '" + anio +"'",
                  :order => "salario_promedio DESC" ,
                  :limit => 20)
  end
  
  
end
