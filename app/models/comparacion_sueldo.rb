
class ComparacionSueldo < ActiveRecord::Base
  
  validates_presence_of     :salario_bruto_actual, :salario_bruto_futuro
  validates_numericality_of  :cantidad_hijos, :otras_cargas, :salario_bruto_actual, :salario_bruto_futuro, :ticket_actual, :ticket_futuro, :bonus_actual, :bonus_futuro 

  
  
  def salario_actual
    salario_actual = Salary.new( :cantidad_hijos=> cantidad_hijos, :otras_cargas => otras_cargas, :deduce_conyuge => deduce_conyuge, :cargo =>"noaplica",:rubro_empresa=>"noaplica" )     
    salario_actual.set_monthly_salary_for_all_months(salario_bruto_actual, ticket_actual, bonus_actual/12.0)  
    salario_actual
  end
  
  def salario_futuro
  salario_futuro =  Salary.new( :cantidad_hijos=> cantidad_hijos, :otras_cargas => otras_cargas, :deduce_conyuge => deduce_conyuge, :cargo =>"noaplica",:rubro_empresa=>"noaplica" )     
  salario_futuro.set_monthly_salary_for_all_months(salario_bruto_futuro, ticket_futuro, bonus_futuro/12.0)
  salario_futuro
  end
  
  def  diferencia_anual_sin_ganancias
     salario_futuro.bruto_y_ticket_menos_desc_acum()[:diciembre]  - salario_actual.bruto_y_ticket_menos_desc_acum()[:diciembre] 
  end
  
  
  def diferencia_anual
    neto_anual_futuro - neto_anual_actual
#    total_dif_anual = 0
#    
#    diferencia_neta_mensual.each { |mes, diferencia_mensual|  total_dif_anual += diferencia_mensual } 
#    total_dif_anual
  end

#  def diferencia_neta_mensual
#    neto_anual_por_mes = salario_actual.salario_neto_de_bolsillo
#    neto_futuro_por_mes = salario_futuro.salario_neto_de_bolsillo
#    
#    diferencia_neta_por_mes= salario_futuro.monthly_difference(neto_futuro_por_mes, neto_anual_por_mes)
#    
#  end
  
  def neto_actual_sin_ganancia
    salario_actual.neto_del_mes_acum()[:diciembre]
  end
  
  def neto_futuro_sin_ganancia
    salario_futuro.neto_del_mes_acum()[:diciembre]
  end
  
  def neto_anual_actual
    salario_actual.salario_neto_anual
  end
  
  def neto_anual_futuro
    salario_futuro.salario_neto_anual
  end
  
  private 
  
  #TODO LLEVAR A APplication_helper!!! y el de salary tambien!
  def apply_function_each_month
    Salary::MONTHS.inject({}) do |anual_sal,mes|
      anual_sal.merge(mes => yield(mes))  
     end
  end

  
end
