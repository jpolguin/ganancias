require File.dirname(__FILE__) + '/../test_helper'

class RevenueParameterTest < Test::Unit::TestCase
  fixtures :revenue_parameters, :revenue_parameter_details

  # Replace this with your real tests.
  def test_find_DEDUCCIONES_SIN_DETALLE
    
    deduccion_conyuge = RevenueParameter.find(:first, :conditions => "name = 'CONYUGE' ") 
    assert_in_delta(8000.0, deduccion_conyuge.value, 0.01)
    
    deduccion_minimo_no_imponible = RevenueParameter.find(:first, :conditions => "name = 'MINIMO_NO_IMPONIBLE' ") 
    assert_in_delta(7500.0, deduccion_minimo_no_imponible.value, 0.01)
    
  end
  
  def test_find_parametro_con_detalle
    
    tope_obra_social = RevenueParameter.find(:first, :conditions => "name = 'SUELDO_TOPE_PARA_OBRA_SOCIAL' ") 
    
    assert_in_delta(4800.0, tope_obra_social.valor_para_mes(:marzo), 0.01 )
    assert_in_delta(4800.0, tope_obra_social.valor_para_mes(:junio), 0.01 )
    assert_in_delta(4800.0, tope_obra_social.valor_para_mes(:noviembre), 0.01 )
    
    porcentaje_jubilacion =  RevenueParameter.find(:first, :conditions => "name = 'PORCENTAJE_DESCUENTO_JUBILACION' ")    
    
    assert_in_delta(0.07, porcentaje_jubilacion.valor_para_mes(:enero),0.01)
    assert_in_delta(0.07, porcentaje_jubilacion.valor_para_mes(:mayo),0.01)
    assert_in_delta(0.07, porcentaje_jubilacion.valor_para_mes(:agosto),0.01)
  end
  
end
