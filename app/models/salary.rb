class Salary < ActiveRecord::Base
  MONTHS = [:enero, :febrero, :marzo, :abril, :mayo, :junio,:julio,:agosto,:septiembre,
            :octubre,:noviembre,:diciembre]
          
  MONTHS_FOR_HUMANS =["Ene","Feb","Mar","Abr","May","Jun", "Jul","Agos","Sept",
            "Oct","Nov","Dic"]
          
 PORCENTAJE_GANANCIA_NETA_PARA_DEDUCC_ESPECIALES = 0.05         
 
  has_many :monthly_salaries
  has_many :special_discounts  
  
  belongs_to :position
  validates_presence_of :position_id 
  validates_numericality_of  :cantidad_hijos, :otras_cargas , :anio_fiscal
   
  attr_accessor :aplicar_descuentos_especiales
  
  def initialize(attributes=nil)
    super(attributes)
    @aplicar_descuentos_especiales = false
 #   @monthly_salaries = []
  end
       
  def set_monthly_salary_for_all_months(gross_salary, ticket =0.0, bonus =0.0)
    for mes in MONTHS
        salarioMensual = MonthlySalary.new(:month => mes, :gross_salary => gross_salary , 
          :ticket => ticket , :bonus => bonus)
        monthly_salaries << salarioMensual
    end
  end

  def set_special_discounts_for_all_months(personal_domestico=0.0, intereses_hipotecarios =0.0, aportes_voluntarios_afjp =0.0, seguro_retiro=0.0, seguro_vida=0.0, cuota_medica=0.0, donacion=0.0, honorario_medico=0.0 )
    special_discounts([])
    for mes in MONTHS
        descuento_especial = SpecialDiscount.new(:month => mes, :personal_domestico => personal_domestico , 
          :intereses_hipotecarios => intereses_hipotecarios, :aportes_voluntarios_afjp => aportes_voluntarios_afjp, :seguro_retiro => seguro_retiro, :seguro_vida =>seguro_vida , :cuota_medica => cuota_medica, :donacion => donacion , :honorario_medico => honorario_medico)
        special_discounts << descuento_especial
    end
  end


  
    # Anual Functions 
  def salario_bruto_por_mes
    apply_function_each_month {|mes| salario_bruto_mes(mes)}
  end

  def descuento_obra_social_por_mes
    apply_function_each_month {|mes| descuento_mensual_obra_social(mes)}
  end
  
  def descuento_jubilacion_por_mes
    apply_function_each_month {|mes| descuento_mensual_jubilacion(mes)}
  end

  def salario_mensual_mas_ticket_y_bonos(mes)
     salario_bruto_mes(mes) + monto_ticket_del_mes(mes) + monto_bono_del_mes(mes)
  end

  def salario_bruto_mes(mes) 
       # monthly_gross_salary_for(mes)   * multiplicador_segun_mes_aguinaldo(mes)
       salario_del_mes(mes).gross_salary *  multiplicador_segun_mes_aguinaldo(mes) 
  end 
  
  def monto_ticket_del_mes(mes)
       salario_del_mes(mes).ticket
  end

  def monto_bono_del_mes(mes)
    salario_del_mes(mes).bonus
  end
  
  def salario_del_mes(mes)
     #lista_sal = monthly_salaries.select { |sal| sal.month == mes  }
     lista_sal = monthly_salaries.select { |sal| sal.month.to_s =~ /#{mes}/  }
     #lista_sal = monthly_salaries.find(:all, :conditions => ["month = :m", {:m => mes}])
     lista_sal[0]
  end

def deduccion_especial_del_mes(mes)
     lista_dedux = special_discounts.select { |dedux| dedux.month.to_s =~ /#{mes}/  }
     lista_dedux[0]
end  
  
def neto_del_mes_acum
acumulate_anual {| mes | ( 
  salario_mensual_mas_ticket_y_bonos(mes) +  descuento_mensual_obra_social( mes) + descuento_mensual_jubilacion(mes)         )  
}       
 
end   
  #Ganancia Neta sujeta a impuesto: Total ingresos acumulados(menos jub y OS) prorrateado mensual
  #menos El  total de descuentos (por esposa, hijos, otras cargas) prorrateado mensual.
  #salary_minus_prev_discount[mes] + deduction_acum[mes] es "+" porque las deducciones son negativas
  def ingreso_neto_sujeto_a_impuesto_por_mes
     salary_minus_prev_discount = bruto_y_ticket_menos_desc_acum;
     deduction_acum = deducciones_generales_por_mes_acum 
     apply_function_each_month {|mes| (salary_minus_prev_discount[mes] + deduction_acum[mes]<=0 ? 0.0: salary_minus_prev_discount[mes] + deduction_acum[mes])   }
  end
  
  # Impuesto de Ganancia neta totalizado a cada mes, es decir, cada mes es la proyeccion de lo 
  # que se deberia retener anual. Es buscar la ganancia Neta sujeta a impuestos (ingreso_neto_sujeto_a_impuesto_por_mes)  en la
  # tabla de alicuota de ganancias + monto fijo por rango.
  def impuesto_a_ganancias_por_mes
    ingreso_neto_sujeto_a_impuestos = ingreso_neto_sujeto_a_impuesto_por_mes
    apply_function_each_month {|mes| RevenueTax.total_tax(mes, ingreso_neto_sujeto_a_impuestos[mes]) }
  end
  
  
  # Monthly Funcions  - todas devuelven valores mensuales
  
  #ESTA ES LA FUNCION!! la que devuelve el monto total de ganancias retenido del sueldo mensual
  def ganancia_a_retener_por_mes 
     ganancias_por_mes = impuesto_a_ganancias_por_mes
     retenido_mes_anterior = 0.0
     apply_function_each_month {|mes|
      a_retener = ganancias_por_mes[mes] + retenido_mes_anterior  #OJO es '+' porque retenido_mes anterior es negativo
      retenido_mes_anterior = (-1) * a_retener + retenido_mes_anterior
      a_retener
    }
    
  end
  
  
  def descuento_mensual_obra_social(mes)
    descuento = 0
    monto_a_aplicar = salario_del_mes(mes).gross_salary 
    bono_del_mes = monto_bono_del_mes(mes)
    descuento = aplico_descuento_por_obra_social(monto_a_aplicar, mes) + aplico_descuento_por_obra_social(bono_del_mes,mes)
    if tiene_aguinaldo(mes) 
      descuento = descuento + aplico_descuento_por_obra_social(monto_a_aplicar/2.0, mes)  
    end    
    return descuento 
  end
  
  def descuento_mensual_jubilacion(mes)
    descuento = 0
    monto_a_aplicar =  salario_del_mes(mes).gross_salary 
    bono_del_mes = monto_bono_del_mes(mes)
    descuento = aplico_descuento_por_jubilacion(monto_a_aplicar, mes) +  aplico_descuento_por_jubilacion(bono_del_mes, mes)
    if (tiene_aguinaldo(mes))
      descuento = descuento + aplico_descuento_por_jubilacion(monto_a_aplicar/2.0, mes)  
    end
    return descuento
  end
  
 
  
  # Acum functions: Todos estos metodos acumulan sobre un mismo hash 
  def bruto_y_ticket_acum_por_mes
    acumulate_anual {| mes | salario_mensual_mas_ticket_y_bonos(mes) }
  end
  
  def descuentos_previsionales_acum_por_mes
    acumulate_anual {| mes | descuento_mensual_obra_social( mes) + descuento_mensual_jubilacion(mes) }
  end
  
  #descuento_mensual_obra_social y jubilacion son negativos, por eso en la formula suman.
  # descuentos especiales deducibles son positivos, por eso restan.
  
  
  def bruto_y_ticket_menos_desc_acum()
    bruto_menos_descuentos =  neto_del_mes_acum
    
    if (@aplicar_descuentos_especiales)  
     descuentos_especiales =  descuentos_especiales_deducibles_acum
     bruto_menos_descuentos =   apply_function_each_month {|mes| neto =  bruto_menos_descuentos[mes] - descuentos_especiales[mes]
                                                                (neto<0? 0.0: neto)
                                }
    end
    bruto_menos_descuentos
  end
  
  def deducciones_generales_por_mes_acum
    bruto_menos_descuentos = bruto_y_ticket_menos_desc_acum    
    apply_function_each_month {| mes |  deduccion_general_del_mes(mes) * (1-ReductionTax.find_reduction_tax(mes,bruto_menos_descuentos[mes]))}
  end
  
  
  def deduccion_general_del_mes(month)
    return (total_anual_deducciones_generales / 12) * (MONTHS.index(month)+1)    
  end
  

  
  def total_anual_deducciones_generales
    
     if (deduce_conyuge?)
       total_conyuge = SalaryConstant.deduccion_conyuge(anio_fiscal)
       
     else 
      total_conyuge = 0.0
    end 
    SalaryConstant.minimo_no_imponible(anio_fiscal) + SalaryConstant.deduccion_especial(anio_fiscal) +
      (SalaryConstant.deduccion_por_hijo(anio_fiscal) * cantidad_hijos) + (otras_cargas *  SalaryConstant.deduccion_otras_cargas(anio_fiscal)) +
      total_conyuge
    
    
  end



  #TODO falta TESTEAR!!
def salario_neto_de_bolsillo
    ganancia_mensual = ganancia_a_retener_por_mes
    apply_function_each_month {|mes| salario_mensual_mas_ticket_y_bonos(mes) +
        descuento_mensual_jubilacion(mes) + descuento_mensual_obra_social(mes) - ganancia_mensual[mes] }
end  

  #TODO FALTA TESTEAR!!!
def salario_neto_anual
  salario_neto_mensual  = salario_neto_de_bolsillo
  neto_acum = acumulate_anual {
          | mes |  
          salario_neto_mensual[mes]
    }
    neto_acum[:diciembre]
end
  

  # El monto de los descuentos especiales Hipotecarios, seguros, donaciones, etc 
  # es positivo asi que restan a los ingresos
  def descuentos_especiales_deducibles_acum()
    monto_interes_hipotecario = intereses_hipotecarios_deducibles
    monto_descuento_personal_domestico = personal_domestico_deducible
    vida_deducible = seguro_vida_deducible 
    retiro_deducible = seguro_retiro_deducible
    aportes_afjp = aportes_voluntarios_afjp_deducibles
    honorarios = honorarios_medicos_deducibles
    cuota_medica = cuota_medica_deducible
    donaciones = donaciones_deducibles
    apply_function_each_month {| mes | monto_interes_hipotecario[mes] + monto_descuento_personal_domestico[mes] + vida_deducible[mes] + retiro_deducible[mes] + aportes_afjp[mes] + honorarios[mes] + cuota_medica[mes] + donaciones [mes] }
  end
  
  
  
  def personal_domestico_deducible()
    acumulate_anual_hasta_tope(9000) {
      | mes | deduccion_especial_del_mes(mes).personal_domestico 
    }
    
  end
  
  def intereses_hipotecarios_deducibles()
    acumulate_anual_hasta_tope(20000) {
      | mes | deduccion_especial_del_mes(mes).intereses_hipotecarios 
    }
  end
  
  def  seguro_vida_deducible
    acumulate_anual_hasta_tope(996.23) {
      | mes | deduccion_especial_del_mes(mes).seguro_vida 
    }
  end
  
  def seguro_retiro_deducible
    acumulate_anual_hasta_tope(1261.16) {
      | mes | deduccion_especial_del_mes(mes).seguro_retiro
    }
    
  end
  
  def aportes_voluntarios_afjp_deducibles
    acumulate_anual {
          | mes | deduccion_especial_del_mes(mes).aportes_voluntarios_afjp
    }
  end
  
  def honorarios_medicos_deducibles
    honorarios_medicos_acum = acumulate_anual {
      | mes |deduccion_especial_del_mes(mes).honorario_medico
    }
    aplicar_porcentaje_deduccion_especial_x_por_ciento_ganancia_neta(honorarios_medicos_acum,PORCENTAJE_GANANCIA_NETA_PARA_DEDUCC_ESPECIALES)
  end
  
  def donaciones_deducibles
    donaciones_acum =  acumulate_anual {
      | mes |deduccion_especial_del_mes(mes).donacion
    }
    aplicar_porcentaje_deduccion_especial_x_por_ciento_ganancia_neta(donaciones_acum,PORCENTAJE_GANANCIA_NETA_PARA_DEDUCC_ESPECIALES)
  end
  
  def cuota_medica_deducible
    cuota_medica_acum =  acumulate_anual {
      | mes |deduccion_especial_del_mes(mes).cuota_medica
    }
    aplicar_porcentaje_deduccion_especial_x_por_ciento_ganancia_neta(cuota_medica_acum,PORCENTAJE_GANANCIA_NETA_PARA_DEDUCC_ESPECIALES)
    
    
  end
  
# De acuerdo a si la deduccion especial acumulada supera el 5% de la ganancia neta del mes acumulada
#entonce la deduccion que se  devuelve es el 5% de la ganancia neta, sino se devuelve la deduccion especial.
def aplicar_porcentaje_deduccion_especial_x_por_ciento_ganancia_neta(deduccion_especial_acumulada,porcentaje)
     neto_acum = ganancia_neta_del_mes_para_deduccion_especial   
    apply_function_each_month {| mes | porciento_neto_acum = (porcentaje * neto_acum[mes])
      ((deduccion_especial_acumulada[mes]<= porciento_neto_acum)? deduccion_especial_acumulada[mes]:porciento_neto_acum)
    }
end   

  
  def ganancia_neta_del_mes_para_deduccion_especial
    neto_del_mes = neto_del_mes_acum
    vida_deducible = seguro_vida_deducible
    retiro_deducible = seguro_retiro_deducible
    apply_function_each_month{
      | mes | neto_del_mes[mes]  - vida_deducible[mes]- retiro_deducible[mes]
    }
    
  end
  
  def monthly_difference(hash_anual1, hash_anual2)
    apply_function_each_month  {| mes | hash_anual1[mes] -hash_anual2[mes]}
  end
  
  protected

  def validate
  end
  
  
  
  private

  

  
 def multiplicador_segun_mes_aguinaldo(mes)
    if (mes == :junio or mes == :diciembre)
      return  1.5
    end
    return 1
  end  

  def apply_function_each_month
    Salary::MONTHS.inject({}) do |anual_sal,mes|
      anual_sal.merge(mes => yield(mes))  
     end
  end

  def acumulate_anual()
    anual_subtotal_hash={}
    suma_acum=0
    Salary::MONTHS.each() do |mes|
      suma_acum+= yield(mes)
      #puts" ACUMULO= #{suma_acum}"
      anual_subtotal_hash[mes] =  suma_acum
     end
    return anual_subtotal_hash
  end
  
  def acumulate_anual_hasta_tope(tope)
    anual_subtotal_hash={}
    suma_acum=0
    Salary::MONTHS.each() do |mes|
      suma_acum+= yield(mes)
      if (suma_acum>tope)
        suma_acum = tope
      end
      anual_subtotal_hash[mes] =  suma_acum
     end
    return anual_subtotal_hash
    
  end  
  
   def aplico_descuento_por_jubilacion(monto, mes)
    if (monto<= SalaryConstant.tope_sueldo_para_jubilacion(anio_fiscal, mes))
      monto * SalaryConstant.porcentaje_descuento_jubilacion(anio_fiscal,mes)
    else
      SalaryConstant.tope_sueldo_para_jubilacion(anio_fiscal, mes) * SalaryConstant.porcentaje_descuento_jubilacion(anio_fiscal,mes)
    end

  end
  
  
  def aplico_descuento_por_obra_social(monto, mes)  
      if (monto <= SalaryConstant.tope_sueldo_obra_social(anio_fiscal, mes) )
          monto * SalaryConstant.porcentaje_descuento_obra_social(anio_fiscal, mes)
      else
         SalaryConstant.tope_sueldo_obra_social(anio_fiscal, mes) * SalaryConstant.porcentaje_descuento_obra_social(anio_fiscal, mes) 
      end 
  end
    
  def tiene_aguinaldo(mes)
     mes == :junio or mes == :diciembre
  end
  
  

  
end
