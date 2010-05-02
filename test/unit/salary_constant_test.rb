# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

#$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require File.dirname(__FILE__) + '/../test_helper'
#require 'test/unit'
#require 'salary_constant'

class SalaryConstantTest < Test::Unit::TestCase
  fixtures :revenue_parameters, :revenue_parameter_details
  
  def test_obtener_minimo_no_imponible
    assert_in_delta(-7500.0, SalaryConstant.minimo_no_imponible(2007), 0.01 )
    assert_in_delta(-5000.0, SalaryConstant.minimo_no_imponible(2005), 0.01 )
    assert_in_delta(-7500.0, SalaryConstant.minimo_no_imponible(2007), 0.01 )
  end
 

  def test_obtener_constantes_descuento_jubilacion_por_mes
   assert_in_delta(-0.07,SalaryConstant.porcentaje_descuento_jubilacion(2007,:enero),0.001)
   assert_in_delta(-0.07,SalaryConstant.porcentaje_descuento_jubilacion(2007,:diciembre),0.001)
   
   assert_in_delta(6000,SalaryConstant.tope_sueldo_para_jubilacion(2007,:mayo),0.001)

  end  

  def test_obtener_otras_deducciones_anuales
    assert_in_delta(-2500,SalaryConstant.deduccion_otras_cargas(2005),0.01)
    assert_in_delta(-8000,SalaryConstant.deduccion_conyuge(2007),0.01)
    assert_in_delta(-4000,SalaryConstant.deduccion_por_hijo(2007),0.01)
    assert_in_delta(-3000,SalaryConstant.deduccion_otras_cargas(2007),0.01)
    assert_in_delta(-2500,SalaryConstant.deduccion_otras_cargas(2005),0.01)
  end  
  
  def test_obtener_constantes_obra_social_por_mes
   assert_in_delta(-0.06,SalaryConstant.porcentaje_descuento_obra_social(2007,:enero),0.001)
   assert_in_delta(-0.06,SalaryConstant.porcentaje_descuento_obra_social(2007,:diciembre),0.001)
   
   assert_in_delta(4800,SalaryConstant.tope_sueldo_obra_social(2007,:mayo),0.001)
    
  end
  
  
end
