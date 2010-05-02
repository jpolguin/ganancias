class ComparacionSueldosController < ApplicationController
  
  def index
     clear_comparacion
     @comparacion_sueldo = find_create_comparacion_sueldo
  end
  
  def comparar_sueldos
    @comparacion_sueldo = ComparacionSueldo.new(params[:comparacion_sueldo]);
    @bruto_actual  = @comparacion_sueldo.salario_bruto_actual 
    @bruto_futuro  =  @comparacion_sueldo.salario_bruto_futuro  
    @neto_actual_sin_ganancia = @comparacion_sueldo.neto_actual_sin_ganancia 
    @neto_futuro_sin_ganancia  = @comparacion_sueldo.neto_futuro_sin_ganancia
    @neto_actual_con_ganancia = @comparacion_sueldo.neto_anual_actual 
    @neto_futuro_con_ganancia = @comparacion_sueldo.neto_anual_futuro
    @diferencia_sin_ganancia = @comparacion_sueldo.diferencia_anual_sin_ganancias
    @diferencia_con_ganancia = @comparacion_sueldo.diferencia_anual
    @diferencia_mensual_sin_ganancia = @diferencia_sin_ganancia / 12
    @diferencia_mensual_con_ganancia = @diferencia_con_ganancia / 12
    
    @procentaje_sin_ganancia = (@diferencia_sin_ganancia / @neto_actual_sin_ganancia) * 100
    @procentaje_con_ganancia = (@diferencia_con_ganancia / @neto_actual_con_ganancia) * 100
    
  end
  
  private 
  
   def find_create_comparacion_sueldo
    session[:comparacion_sueldo] ||= ComparacionSueldo.new( :cantidad_hijos => 0, :otras_cargas =>0, :salario_bruto_actual => 0.0, :salario_bruto_futuro => 0.0, :ticket_actual => 0.0 , :ticket_futuro =>  0.0, :bonus_actual => 0.0, :bonus_futuro=> 0.0) 
  end
  
  def clear_comparacion
    session[:comparacion_sueldo]  =   nil
    
  end
  
  
end
