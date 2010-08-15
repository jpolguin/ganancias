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
  
  
end
