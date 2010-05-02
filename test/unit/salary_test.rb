require File.dirname(__FILE__) + '/../test_helper'

class SalaryTest < Test::Unit::TestCase
  fixtures :positions, :reduction_taxes, :revenue_taxes, :revenue_parameters, :revenue_parameter_details
   
  def test_hash
      anual_salary = Salary::MONTHS.inject({}) do |anual_sal , mes|
       anual_sal.merge(mes => 6500)
     end
     assert_equal 12, anual_salary.size
     assert_equal 6500, anual_salary[:febrero]
  end
  
    def test_monthly_salary_for_month
    puts "test_monthly_salary_for_month"
    salary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false)
    salary.set_monthly_salary_for_all_months(1000, 300,  0)
    
    enero = salary.salario_del_mes(:enero)
    assert_in_delta 1000, enero.gross_salary ,0.01
    assert_in_delta 300, enero.ticket,0.01
    
    end

  
  def  test_salario_bruto_mes
    puts "test_salario_bruto_mes"
    grossSalary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false)
    grossSalary.set_monthly_salary_for_all_months(1000)
    
    assert_equal 1000,grossSalary.salario_bruto_mes(:marzo)
    assert_equal 1500,grossSalary.salario_bruto_mes(:junio)
    assert_equal 1500,grossSalary.salario_bruto_mes(:diciembre)
    assert_equal 1000,grossSalary.salario_bruto_mes(:enero)
  end
  
  
  def test_descuento_mensual_obra_social
     puts "test_descuento_mensual_obra_social"
      grossSalary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(1000)
      assert_equal(-60.0, grossSalary.descuento_mensual_obra_social(:marzo),"Deberia dar lo mismo ")
      
      grossSalary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months( 4800, 100.0)
      assert_equal( -288, grossSalary.descuento_mensual_obra_social(:marzo))
      # No cambia mas alla de 4800
      # No cambia mas alla de 4800
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(6500, 100.0)
      assert_equal( -288, grossSalary.descuento_mensual_obra_social(:marzo))
    
      # hasta 4000 esta el tope
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(4000, 100.0)
      assert_equal( -240, grossSalary.descuento_mensual_obra_social(:mayo))
      
      # pero si es con aguinaldo se pasa del tope
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months( 4000, 100.0)
      assert_equal( -360, grossSalary.descuento_mensual_obra_social(:diciembre))
    
    
  end
   
  def test_descuento_obra_social_anual
       puts "test_descuento_obra_social_anual"
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(4000, 100.0)
      anual_social_discount = grossSalary.descuento_obra_social_por_mes
      
      assert_equal( -240, anual_social_discount[:enero])
      assert_equal( -240, anual_social_discount[:marzo])
      assert_equal( -360, anual_social_discount[:junio])
      assert_equal( -360, anual_social_discount[:diciembre])
  end
  

  def test_descuento_obra_social_anual_con_bonus
       puts "test_descuento_obra_social_con_bonus"
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(4000, 100.0,4000)
      anual_social_discount = grossSalary.descuento_obra_social_por_mes
      
      assert_equal( -480, anual_social_discount[:enero])
      assert_equal( -480, anual_social_discount[:marzo])
      assert_equal( -600, anual_social_discount[:junio])
      assert_equal( -600, anual_social_discount[:diciembre])
      
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(4000, 100.0,6000)
      anual_social_discount = grossSalary.descuento_obra_social_por_mes

      assert_equal( -528, anual_social_discount[:febrero])
      assert_equal( -528, anual_social_discount[:noviembre])
      
      assert_equal( -648, anual_social_discount[:junio])
      assert_equal( -648, anual_social_discount[:diciembre])

    
  end


  
  def test_descuento_jubilacion
    puts "test_descuento_jubilacion"
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(4000,100.0)
      assert_in_delta(-280.0, grossSalary.descuento_mensual_jubilacion(:enero), 0.01)
      assert_in_delta(-420.0, grossSalary.descuento_mensual_jubilacion(:junio), 0.01)
      
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(5500, 100.0)
      assert_in_delta(-385.0, grossSalary.descuento_mensual_jubilacion(:enero), 0.01)
      assert_in_delta(-577.5, grossSalary.descuento_mensual_jubilacion(:junio), 0.01)
      assert_in_delta(-577.5, grossSalary.descuento_mensual_jubilacion(:diciembre), 0.01)
  end
  

  def test_descuento_jubilacion_con_bonus
    puts "test_descuento_jubilacion"
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      grossSalary.set_monthly_salary_for_all_months(4000,100.0,4000)
      assert_in_delta(-560.0, grossSalary.descuento_mensual_jubilacion(:abril), 0.01)
      assert_in_delta(-700.0, grossSalary.descuento_mensual_jubilacion(:junio), 0.01)
      
      grossSalary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
      # El tope de sueldos jubilacion para TEST es de 6000
      grossSalary.set_monthly_salary_for_all_months(5500, 100.0,6700) 
      assert_in_delta(-805.0, grossSalary.descuento_mensual_jubilacion(:enero), 0.01)
      assert_in_delta(-997.5, grossSalary.descuento_mensual_jubilacion(:junio), 0.01)
      assert_in_delta(-997.5, grossSalary.descuento_mensual_jubilacion(:diciembre), 0.01)
  end

  
  def test_monthly_salary_plus_ticket
    puts "test_monthly_salary_plus_ticket"
    salary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false)
    salary.set_monthly_salary_for_all_months( 4000,  100.0)
    
    assert_equal(4100, salary.salario_mensual_mas_ticket_y_bonos(:enero))
    assert_equal(4100, salary.salario_mensual_mas_ticket_y_bonos(:mayo))
    assert_equal(6100, salary.salario_mensual_mas_ticket_y_bonos(:junio))
    assert_equal(4100, salary.salario_mensual_mas_ticket_y_bonos(:noviembre))
    
    salary = Salary.new( :position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false)
    salary.set_monthly_salary_for_all_months( 5000, 0.0)
    
    assert_equal(5000, salary.salario_mensual_mas_ticket_y_bonos(:enero))
    assert_equal(7500, salary.salario_mensual_mas_ticket_y_bonos(:diciembre))
        
  end
  
  def test_anual_subtotal_salary_acum
     puts "test_anual_subtotal_salary_acum"
     salary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false)
     salary.set_monthly_salary_for_all_months(6500 , 200.0)
     anual_subtotal_acum = salary.bruto_y_ticket_acum_por_mes
     
    assert_equal(6700, anual_subtotal_acum[:enero])
    assert_equal(13400, anual_subtotal_acum[:febrero])
    
    assert_equal(76950, anual_subtotal_acum[:noviembre])
    
    assert_equal(86900, anual_subtotal_acum[:diciembre])
    
  end
  
  def test_anual_previsional_discount_acum
    puts "test_anual_previsional_discount_acum"
     salary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
     salary.set_monthly_salary_for_all_months(6500 , 200.0)
     anual_previsional_acum = salary.descuentos_previsionales_acum_por_mes
    assert_equal(-708, anual_previsional_acum[:enero])
    assert_equal(-2832, anual_previsional_acum[:abril])
    assert_equal(-9341, anual_previsional_acum[:diciembre])
    
     salary = Salary.new(:position_id => 3, :cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
     salary.set_monthly_salary_for_all_months(6000 , 200.0)
     anual_previsional_acum = salary.descuentos_previsionales_acum_por_mes
     
     assert_equal(-9276, anual_previsional_acum[:diciembre])
     
     salary = Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
     salary.set_monthly_salary_for_all_months(10269, 0.0)
     anual_previsional_acum = salary.descuentos_previsionales_acum_por_mes

    assert_in_delta(-2832, anual_previsional_acum[:abril],0.01)
    
    assert_in_delta(-4895.42, anual_previsional_acum[:junio],0.01)
    assert_in_delta(-7727.42, anual_previsional_acum[:octubre],0.01)
    
  end
  
  
  
  
  
  def test_calculate_total_deductions
    puts "test_calculate_total_deductions"
    salary =   Salary.new(:position_id => 3,:cantidad_hijos=>0, :otras_cargas => 0, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(6500 , 200.0)                    
      
    assert_equal(-43500, salary.total_anual_deducciones_generales)
    
    salary =   Salary.new( :position_id => 3,
                          :cantidad_hijos=>1, :otras_cargas => 1, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(6500 , 200.0)
    assert_equal(-50500, salary.total_anual_deducciones_generales)
    
    salary =   Salary.new(:position_id => 3,
                          :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(6500 , 200.0)
    assert_equal(-62500, salary.total_anual_deducciones_generales)
    
  end

  def test_deducciones_generales_por_mes
    puts "test_deducciones_generales_por_mes"
    salary =   Salary.new(:position_id => 3,:cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true, :anio_fiscal => 2007)
                        
    salary.set_monthly_salary_for_all_months(6500 , 200.0)
    assert_equal(-62500, salary.total_anual_deducciones_generales)
    
    assert_in_delta(-5208.33,salary.deduccion_general_del_mes(:enero)   , 0.01)
    assert_in_delta(-10416.67,salary.deduccion_general_del_mes(:febrero), 0.01)
    assert_in_delta(-31250.00,salary.deduccion_general_del_mes(:junio)  , 0.01)
    
    
  end
  
  def test_anual_deduction_amount_acum
    puts "test_anual_deduction_amount_acum"
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true, :anio_fiscal=>2007)
    
    salary.set_monthly_salary_for_all_months(6000 , 100.0)
    anual_deduction_amount_acum = salary.deducciones_generales_por_mes_acum
    
    
    assert_in_delta(-5208.33,anual_deduction_amount_acum[:enero],0.01)
    assert_in_delta(-10416.67,anual_deduction_amount_acum[:febrero],0.01)
    assert_in_delta(-26041.67,anual_deduction_amount_acum[:mayo],0.01)
    
  end
  
  def test_ingreso_neto_sujeto_a_impuestos
    puts "test_ingreso_neto_sujeto_a_impuestos"
    salary =   Salary.new(:position_id => 3,
                          :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(6000 , 100.0)
    
    ingreso_neto_sujeto_a_impuestos = salary.ingreso_neto_sujeto_a_impuesto_por_mes
    
    assert_in_delta(183.67 ,ingreso_neto_sujeto_a_impuestos[:enero] ,0.01) 
    assert_in_delta(734.67 ,ingreso_neto_sujeto_a_impuestos[:abril] ,0.01) 
    assert_in_delta(3712.0 ,ingreso_neto_sujeto_a_impuestos[:junio] ,0.01) 
    assert_in_delta(4263.0 ,ingreso_neto_sujeto_a_impuestos[:septiembre] ,0.01) 
    assert_in_delta(4446.66 ,ingreso_neto_sujeto_a_impuestos[:octubre] ,0.01) 
    
    
    salary =   Salary.new(:position_id => 3,
                          :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(5000 , 100.0)                        
    
    ingreso_neto_sujeto_a_impuestos = salary.ingreso_neto_sujeto_a_impuesto_por_mes
    
    assert_in_delta(0.0 , ingreso_neto_sujeto_a_impuestos[:enero] ,0.01) 
    assert_in_delta(0.0 , ingreso_neto_sujeto_a_impuestos[:febrero] ,0.01) 
    assert_in_delta(0.0 , ingreso_neto_sujeto_a_impuestos[:marzo] ,0.01) 
    assert_in_delta(0.0, ingreso_neto_sujeto_a_impuestos[:abril] ,0.01) 
    assert_in_delta(0.0 , ingreso_neto_sujeto_a_impuestos[:junio] ,0.01) 
  end
  
  def test_impuesto_ganancias_del_mes
    puts "test_impuesto_ganancias_del_mes"
    salary =   Salary.new(:position_id => 3,:cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(6000 , 100.0)
    
    anual_revenue_tax = salary.impuesto_a_ganancias_por_mes
    assert_in_delta(16.53 ,anual_revenue_tax[:enero] ,0.01) 
    assert_in_delta(33.06 ,anual_revenue_tax[:febrero] ,0.01) 
    assert_in_delta(334.08 ,anual_revenue_tax[:junio] ,0.01) 
    assert_in_delta(383.67 ,anual_revenue_tax[:septiembre] ,0.01) 
    assert_in_delta(400.20 ,anual_revenue_tax[:octubre] ,0.01) 
    
  end
  
  def test_monthly_retained_revenue_tax
    puts "test_monthly_retained_revenue_tax"
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(6000 ,  100.0)
    
    retained_tax = salary.ganancia_a_retener_por_mes
    assert_in_delta(16.53,retained_tax[:enero],0.01)
    assert_in_delta(16.53,retained_tax[:abril],0.01)
    assert_in_delta(16.53,retained_tax[:mayo],0.01)
    
    assert_in_delta(251.43,retained_tax[:junio],0.01)
    assert_in_delta(16.53,retained_tax[:octubre],0.01)
    assert_in_delta(16.53,retained_tax[:noviembre],0.01)
    
    assert_in_delta(251.43,retained_tax[:diciembre],0.01)
    
  end
  
  def test_intereses_hipotecarios_deducibles
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true)
    salary.set_special_discounts_for_all_months(0.0, 200)
    
    intereses_deducibles = salary.intereses_hipotecarios_deducibles
    assert_in_delta(600.0,intereses_deducibles[:marzo] ,0.0)
    assert_in_delta(2400.0,intereses_deducibles[:diciembre] ,0.0)
    
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true)
    salary.set_special_discounts_for_all_months(0.0, 3000)
    
    intereses_deducibles = salary.intereses_hipotecarios_deducibles
    assert_in_delta(9000.0,intereses_deducibles[:marzo] ,0.0)
    assert_in_delta(20000.0,intereses_deducibles[:diciembre] ,0.0)
    
    
  end


  def test_personal_domestico_deducible
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true)
    salary.set_special_discounts_for_all_months(250, 0.0)
    
    monto_deducible = salary.personal_domestico_deducible
    assert_in_delta(750.0,monto_deducible[:marzo] ,0.0)
    assert_in_delta(2000.0,monto_deducible[:agosto] ,0.0)
    
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true)
    salary.set_special_discounts_for_all_months(650, 0)
    
    monto_deducible = salary.personal_domestico_deducible
    assert_in_delta(1950.0,monto_deducible[:marzo] ,0.0)
    assert_in_delta(7150.0,monto_deducible[:noviembre] ,0.0)
    assert_in_delta(7500.0,monto_deducible[:diciembre] ,0.0)
    
    
  end
  
  def test_seguros_deducibles
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true)
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 107, 84 )
    
    monto_deducible = salary.seguro_vida_deducible
    assert_in_delta(252,monto_deducible[:marzo] ,0.0)
    assert_in_delta(672,monto_deducible[:agosto] ,0.0)
    assert_in_delta(996.23,monto_deducible[:diciembre] ,0.0)
    
    
    monto_deducible = salary.seguro_retiro_deducible
    assert_in_delta(321.0,monto_deducible[:marzo] ,0.0)
    assert_in_delta(1177.0,monto_deducible[:noviembre] ,0.0)
    assert_in_delta(1261.16,monto_deducible[:diciembre] ,0.0)
    
    
  end

  def test_aportes_afjp_deducibles_no_tienen_tope

    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true)
    salary.set_special_discounts_for_all_months(0.0, 0.0, 1000, 0, 0 )
    
    monto_deducible = salary.aportes_voluntarios_afjp_deducibles
    assert_in_delta(3000,monto_deducible[:marzo] ,0.0)
    assert_in_delta(8000,monto_deducible[:agosto] ,0.0)
    assert_in_delta(12000,monto_deducible[:diciembre] ,0.0)


    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>2, :otras_cargas => 1, :deduce_conyuge =>true)
    salary.set_special_discounts_for_all_months(0.0, 0.0, 2000, 0, 0 )
    
    monto_deducible = salary.aportes_voluntarios_afjp_deducibles
    assert_in_delta(6000,monto_deducible[:marzo] ,0.0)
    assert_in_delta(16000,monto_deducible[:agosto] ,0.0)
    assert_in_delta(24000,monto_deducible[:diciembre] ,0.0)

    
  end
  
  def test_bruto_y_ticket_menos_desc_acum_con_deduc_especiales
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    #primero sin descuentos especiales
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 0, 0 )
    
    neto_subtotal = salary.bruto_y_ticket_menos_desc_acum()
    
    assert_in_delta(9292,neto_subtotal[:enero],0.01)
    assert_in_delta(120228,neto_subtotal[:diciembre],0.01)
    
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    #Ahora, aplico descuentos especiales
    salary.aplicar_descuentos_especiales = true
    salary.set_special_discounts_for_all_months 200, 0.0, 0.0, 0, 0 
    neto_subtotal = salary.bruto_y_ticket_menos_desc_acum()

    assert_in_delta(9092,neto_subtotal[:enero],0.01)
    assert_in_delta(65000,salary.bruto_y_ticket_acum_por_mes[:junio],0.01)
    assert_in_delta(-4886, salary.descuentos_previsionales_acum_por_mes[:junio],0.01)
    assert_in_delta(1200, salary.descuentos_especiales_deducibles_acum[:junio],0.01)
    
    assert_in_delta(58914,neto_subtotal[:junio],0.01)
    assert_in_delta(117828,neto_subtotal[:diciembre],0.01)
    
    
    
  end
  
  def test_bruto_y_ticket_menos_desc_especiales_mayor_que_sueldos
    
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(9000,0.0)
    salary.aplicar_descuentos_especiales = true
    salary.set_special_discounts_for_all_months(200, 0.0, 10000, 0, 0 )
    
    neto_subtotal = salary.bruto_y_ticket_menos_desc_acum()
    
    assert_in_delta(0,neto_subtotal[:enero],0.01)
    assert_in_delta(0,neto_subtotal[:junio],0.01)
    assert_in_delta(0,neto_subtotal[:diciembre],0.01)

    
  end
  
  

  def test_sueldo_pasa_bruto_de_91_aplica_reduc_50_por_ciento
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(8200,0.0)
    #primero sin descuentos especiales
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 0, 0 )
    bruto_menos_descuentos = salary.bruto_y_ticket_menos_desc_acum
    
    assert(bruto_menos_descuentos[:diciembre]>91000, "El bruto de diciembre: #{bruto_menos_descuentos[:diciembre]} es menor que 91000") 
    tasa_reduccion = ReductionTax.find_reduction_tax(:diciembre,bruto_menos_descuentos[:diciembre])
    assert_in_delta(0.5, tasa_reduccion,0.01)
    dedux_gen = salary.deducciones_generales_por_mes_acum
    
    assert_in_delta(-23541.67,dedux_gen[:mayo],0.01)
    assert_in_delta(37460, bruto_menos_descuentos[:mayo],0.01)
    assert_in_delta(48519, bruto_menos_descuentos[:junio],0.01)
    
    tasa_reduccion = ReductionTax.find_reduction_tax(:junio, bruto_menos_descuentos[:junio])
    assert_in_delta(0.5, tasa_reduccion, 0.01)
    
    
    
    assert_in_delta(-14125.0,dedux_gen[:junio],0.01)
    
    assert_in_delta(-28250,dedux_gen[:diciembre],0.01) 
    
  end
  
  def test_aplica_dedux_especial_honorario_medico_menor_5_por_ciento_neto_mensual
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    # 100 de vida y retiro y 200 de honorarios medicos por mes
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 100,100,0,0,200 )
    salary.aplicar_descuentos_especiales = true
    
    honorarios_medicos_dedux = salary.honorarios_medicos_deducibles
    
    assert_in_delta(200,honorarios_medicos_dedux[:enero],0.01)
    assert_in_delta(1200,honorarios_medicos_dedux[:junio],0.01)
    assert_in_delta(2400, honorarios_medicos_dedux[:diciembre],0.01)

    
  end
  
  def test_honorario_medico_mayor_5_por_ciento_neto_mensual_deduce_5_pc_ganancia_neta
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    # 100 de vida y retiro y 600 de honorarios medicos por mes, pasa del 5% de ganancia neta mensual
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 100,100,0,0,600 )
    salary.aplicar_descuentos_especiales = true
    
    honorarios_medicos_dedux = salary.honorarios_medicos_deducibles
    
    assert_in_delta(454.6,honorarios_medicos_dedux[:enero],0.01)
    assert_in_delta(2945.7,honorarios_medicos_dedux[:junio],0.01)
    assert_in_delta(5901.59, honorarios_medicos_dedux[:diciembre],0.01)
    
    
  end


  def test_aplica_donaciones_menor_5_por_ciento_neto_mensual
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    # 100 de vida y retiro y 200 de donaciones por mes
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 100,100,0,200 , 0)
    salary.aplicar_descuentos_especiales = true
    
    donaciones_dedux = salary.donaciones_deducibles
    
    assert_in_delta(200,donaciones_dedux[:enero],0.01)
    assert_in_delta(1200,donaciones_dedux[:junio],0.01)
    assert_in_delta(2400, donaciones_dedux[:diciembre],0.01)

  end

def  test_donacion_mayor_5_por_ciento_neto_mensual_deduce_5_pc_ganancia_neta
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    # 100 de vida y retiro y 200 de donaciones por mes
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 100,100,0,600 , 0)
    salary.aplicar_descuentos_especiales = true
    
    donaciones_dedux = salary.donaciones_deducibles

      assert_in_delta(454.6,donaciones_dedux[:enero],0.01)
    assert_in_delta(2945.7,donaciones_dedux[:junio],0.01)
    assert_in_delta(5901.59, donaciones_dedux[:diciembre],0.01)
    

end

def test_descuentos_especiales_deducibles_acum
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    # descuentos de 600 en honorarios medicos, cuota medica  y donacion 
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 0,0,600,600 , 600)
    salary.aplicar_descuentos_especiales=true
    
    descuentos_especiales = salary.descuentos_especiales_deducibles_acum
    
    assert_in_delta(1393.8,descuentos_especiales[:enero],0.01)
  
end

def test_bruto_y_ticket_menos_desc_acum_con_deducciones_honorarios_medicos_cuota_y_donacion
    salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
    salary.set_monthly_salary_for_all_months(10000,0.0)
    # descuentos de 600 en honorarios medicos, cuota medica  y donacion 
    salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0, 0,0,600,600 , 600)
    salary.aplicar_descuentos_especiales=true
    
    bruto_menos_descuentos_especiales = salary.bruto_y_ticket_menos_desc_acum
    
    assert_in_delta(7898.20,bruto_menos_descuentos_especiales[:enero],0.01)
    assert_in_delta(39491.0,bruto_menos_descuentos_especiales[:mayo],0.01)
    assert_in_delta(51096.90,bruto_menos_descuentos_especiales[:junio],0.01)
    assert_in_delta(102193.8,bruto_menos_descuentos_especiales[:diciembre],0.01)
  
end

def test_neto_anual
  salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
  salary.set_monthly_salary_for_all_months(10000,0.0)
  assert_in_delta(100414.82, salary.salario_neto_anual,0.01)
  
  salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
  salary.set_monthly_salary_for_all_months(3500,0.0)
  assert_in_delta(39585, salary.salario_neto_anual,0.01)

  salary =   Salary.new(:position_id => 3, :cantidad_hijos=>1, :otras_cargas => 3, :deduce_conyuge =>false, :anio_fiscal => 2007)
  salary.set_monthly_salary_for_all_months(5000,0.0)
  assert_in_delta(56676.54, salary.salario_neto_anual,0.01)

  

  
end
  
end
