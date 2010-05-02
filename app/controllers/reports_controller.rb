class ReportsController < ApplicationController
  layout "reports", :except => "sueldo_bolsillo_anual"


  def index
  end

  def sueldo_bolsillo_anual
    @sueldo_bolsillo  = session[:salario_bolsillo]
    @ganancia_retenida = session[:ganancia_retenida_mensual] 
      
  end
end
