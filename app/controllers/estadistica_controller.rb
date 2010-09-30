class EstadisticaController < ApplicationController

  def index
  end
  
  
  def estadistica_por_rubro
    @estadisticas_rubro_julio = []
    @estadisticas_rubro_julio = EstadisticaPorRubroMes.find_estadisticas_mes("julio", "2010")

    @estadisticas_rubro_agosto = []
    @estadisticas_rubro_agosto = EstadisticaPorRubroMes.find_estadisticas_mes("agosto", "2010")

    @estadisticas_rubro_septiembre = []
    @estadisticas_rubro_septiembre = EstadisticaPorRubroMes.find_estadisticas_mes("septiembre", "2010")

    
  end
  
   def estadistica_por_cargo
    @estadisticas_cargo_julio = []
    @estadisticas_cargo_julio = EstadisticaPorCargoMes.find_estadisticas_mes("julio", "2010")

    @estadisticas_cargo_agosto = []
    @estadisticas_cargo_agosto = EstadisticaPorCargoMes.find_estadisticas_mes("agosto", "2010")
     
    @estadisticas_cargo_septiembre = []
    @estadisticas_cargo_septiembre = EstadisticaPorCargoMes.find_estadisticas_mes("septiembre", "2010")
    
     
     
  end
  
  def estadistica_promedio_anual
     @estadisticas_promedio = []
     #anio 2010
     @estadisticas_promedio = [{:mes => "enero",:salario_promedio=>6990.30,:anio=>"2010"},{:mes => "febrero",:salario_promedio=>7030.30,:anio=>"2010"},{:mes => "marzo",:salario_promedio=>7325.67,:anio=>"2010"},{:mes => "abril",:salario_promedio=>7289.43,:anio=>"2010"},{:mes => "mayo",:salario_promedio=>7794.96,:anio=>"2010"},{:mes => "junio",:salario_promedio=>7989.30,:anio=>"2010"},{:mes => "julio",:salario_promedio=>7895.71,:anio=>"2010"},{:mes => "agosto",:salario_promedio=>8739.45,:anio=>"2010"},{:mes => "septiembre",:salario_promedio=>8935.47,:anio=>"2010"} ]
  end
   
end
