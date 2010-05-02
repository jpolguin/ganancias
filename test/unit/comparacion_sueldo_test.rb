require File.dirname(__FILE__) + '/../test_helper'

class ComparacionSueldoTest < Test::Unit::TestCase
  fixtures :comparacion_sueldos,  :positions, :reduction_taxes, :revenue_taxes, :revenue_parameters, :revenue_parameter_details

  # Replace this with your real tests.
  def test_diferencia_anual_sin_ganancias_mismoBruto_diferencia_debe_ser_cero
      comparacionSueldoIgualBruto = ComparacionSueldo.new(:salario_bruto_actual=> 3954.0, :salario_bruto_futuro=>3954.0,  :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false) 
    assert_in_delta(0,comparacionSueldoIgualBruto.diferencia_anual_sin_ganancias(),0.01)
  end
  

  def test_diferencia_anual_sin_ganancias_mismoBruto_diferencia_tickets
      comparacionSueldoIgualBruto = ComparacionSueldo.new(:salario_bruto_actual=> 3954.0, :salario_bruto_futuro=>3954.0, :ticket_actual => 200, :ticket_futuro => 400,  :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false) 
    assert_in_delta(2400,comparacionSueldoIgualBruto.diferencia_anual_sin_ganancias(),0.01)
  end


  def test_diferencia_anual_sin_ganancias_difBruto_mas_difTckets_mas_difBonus
      comparacionSueldoIgualBruto = ComparacionSueldo.new(:salario_bruto_actual=> 4000.0, :salario_bruto_futuro=>5000.0, :ticket_actual => 200, :ticket_futuro => 400, :bonus_actual=>2000, :bonus_futuro=>5000, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false) 
    assert_in_delta(16464,comparacionSueldoIgualBruto.diferencia_anual_sin_ganancias(),0.01)
  end
  
  
  def test_diferencia_anual_con_ganancias_todo_igual_diferencia_cero
    comparacionSueldoIgualBruto = ComparacionSueldo.new(:salario_bruto_actual=> 3954.0, :salario_bruto_futuro=>3954.0,  :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false) 
    assert_in_delta(0,comparacionSueldoIgualBruto.diferencia_anual() ,0.01)
    comparacionSueldoTodoIgual = ComparacionSueldo.new(:salario_bruto_actual=> 6500.0, :salario_bruto_futuro=>6500.0,:ticket_actual => 400, :ticket_futuro => 400, :bonus_actual=>4000, :bonus_futuro=>4000,  :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false) 
    assert_in_delta(0,comparacionSueldoTodoIgual.diferencia_anual() ,0.01)
  end

  
  def test_diferencia_con_ganancias_diferencia_bruto_1000
    comparacionSueldo = ComparacionSueldo.new(:salario_bruto_actual=> 5000, :salario_bruto_futuro=>6000.0,  :cantidad_hijos=>0, :otras_cargas =>0, :deduce_conyuge =>false) 
    assert_in_delta(10084.6,comparacionSueldo.diferencia_anual,0.01)
    
  end 
  
  def test_diferencia_mensual_con_ganancias_diferencia_bruto_dif_2000_Ticket_m500
    comparacionSueldo = ComparacionSueldo.new(:salario_bruto_actual=> 5000, :salario_bruto_futuro=>7000.0, :ticket_actual => 500,:ticket_futuro => 0,  :cantidad_hijos=>0, :otras_cargas =>0, :deduce_conyuge =>false) 
    
    assert_in_delta(15025.54,comparacionSueldo.diferencia_anual,0.01)

  end

  

    def test_diferencia_mensual_con_ganancias_diferencia_bruto_3000_cargas_e_hijos
    comparacionSueldo = ComparacionSueldo.new(:salario_bruto_actual=> 6000.0, :salario_bruto_futuro=>9000.0, :bonus_actual => 0,:bonus_futuro => 0, :ticket_actual=> 0, :ticket_futuro=>0, :cantidad_hijos=>1, :otras_cargas =>3, :deduce_conyuge =>false) 
    
    assert_in_delta(91081.32-67512.64,comparacionSueldo.diferencia_anual,0.01)

  end

  
  
  
 
end
