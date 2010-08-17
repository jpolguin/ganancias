class EstadisticaController < ApplicationController

  def index
  end
  
  
  def estadistica_por_rubro
    @estadisticas_rubro = []
    @estadisticas_rubro = EstadisticaPorRubroMes.find_estadisticas_mes("julio", "2010")
    
  end
  
   def estadistica_por_cargo
    @estadisticas_cargo = []
    @estadisticas_cargo = EstadisticaPorCargoMes.find_estadisticas_mes("julio", "2010")
    
  end
  
  def estadistica_promedio_anual
     @estadisticas_promedio = []
     #anio 2010
     @estadisticas_promedio = [{:mes => "enero",:salario_promedio=>6990.30,:anio=>"2010"},{:mes => "febrero",:salario_promedio=>7030.30,:anio=>"2010"},{:mes => "marzo",:salario_promedio=>7325.67,:anio=>"2010"},{:mes => "abril",:salario_promedio=>7289.43,:anio=>"2010"},{:mes => "mayo",:salario_promedio=>7794.96,:anio=>"2010"},{:mes => "junio",:salario_promedio=>7989.30,:anio=>"2010"},{:mes => "julio",:salario_promedio=>7895.71,:anio=>"2010"},{:mes => "agosto",:salario_promedio=>8663,:anio=>"2010"} ]
  end
   
end
