require "date"
class SalaryController < ApplicationController
 auto_complete_for :salary, :cargo
 auto_complete_for :salary, :rubro_empresa
  def index
    clear_salary_y_positions
    @salary = find_salary
    @salary.set_monthly_salary_for_all_months(6000, 0.0, 0.0)
    @salary.experiencia = 0
    @copiar_a_derecha = true
    @mostrar_calcular_deducciones = false
    
  end
  
  def save_salary
    @salary = Salary.new(params[:salary])
    #TODO Convertir en metodo helper en alguna clase o en modulo
    salariosMensuales = []
     params[:salario_mes].each_key  do | indiceMes |
      datos_salario = params[:salario_mes][indiceMes]
      salario_mensual_completo = MonthlySalary.new_from_data(Salary::MONTHS[indiceMes.to_i],
                                               datos_salario["gross_salary"].to_f, datos_salario["ticket"].to_f, datos_salario["bonus"].to_f)
                                             
      salariosMensuales << salario_mensual_completo
    end
    @salary.fecha_calculo = DateTime.now()
    @salary.monthly_salaries = salariosMensuales
    @salary.anio_fiscal = 2008
    if (@salary.save) 
      id_salvado= @salary.id
      clear_salary_y_positions
      redirect_to :action=> :calcular_ganancia, :method => :post, :id => id_salvado
      
    else
      clear_salary_y_positions
      render :action => :index
    end
      
  end
  

  def calcular_ganancia ()
     @salary = Salary.find(params[:id])    
     @anual_salary = @salary.salario_bruto_por_mes()
     @anual_social_discount = @salary.descuento_obra_social_por_mes()
     @anual_retirement_discount = @salary.descuento_jubilacion_por_mes() 
     @anual_subtotal_salary_acum =  @salary.bruto_y_ticket_acum_por_mes
     @anual_previsional_discount_acum =  @salary.descuentos_previsionales_acum_por_mes
     @anual_salary_menos_desc_previsional = @salary.bruto_y_ticket_menos_desc_acum
     @anual_deduction_amount_acum = @salary.deducciones_generales_por_mes_acum
     @anual_net_revenue = @salary.ingreso_neto_sujeto_a_impuesto_por_mes
     @anual_revenue_tax = @salary.impuesto_a_ganancias_por_mes
     @retained_tax = @salary.ganancia_a_retener_por_mes
     @salario_de_bolsillo = @salary.salario_neto_de_bolsillo
     session[:salario_bolsillo] = @salario_de_bolsillo
     session[:ganancia_retenida_mensual] =  @retained_tax
     @mostrar_calcular_deducciones = true
    #@salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0) 
  end
     
  
  def cargar_deducciones_especiales()
    @salary = Salary.find(params[:id])        
    @copiar_a_derecha = true
    @salary.set_special_discounts_for_all_months(0.0, 0.0, 0.0)
    
    
  end
  
  def aplicar_deducciones_especiales        
     @salary = Salary.find(params[:id]) 
    #TODO Convertir en metodo helper en alguna clase o en modulo, se repite pero con Monthlysalay en el metodo save_salary
     descuentos_especiales = []
     if (not params[:deduccion_mes].nil?)
       params[:deduccion_mes].each_key  do | indiceMes |
       datos_dedux = params[:deduccion_mes][indiceMes]
       deduccion_mensual_completa = SpecialDiscount.new_from_data(Salary::MONTHS[indiceMes.to_i],
                                                 datos_dedux["personal_domestico"].to_f, datos_dedux["intereses_hipotecarios"].to_f, datos_dedux["aportes_voluntarios_afjp"].to_f, 
                                                  datos_dedux["seguro_retiro"].to_f, datos_dedux["seguro_vida"].to_f, datos_dedux["cuota_medica"].to_f, datos_dedux["donacion"].to_f,
                                                  datos_dedux["honorario_medico"].to_f)

        descuentos_especiales << deduccion_mensual_completa
        end
     
    @retained_tax = @salary.ganancia_a_retener_por_mes
    @salario_de_bolsillo = @salary.salario_neto_de_bolsillo
    
    #Ahora aplico los descuentos especiales y calculo lo mismo que antes pero tomando los descuentos
    @salary.special_discounts = descuentos_especiales
    @salary.aplicar_descuentos_especiales=true

    @retained_tax_with_especial_discounts        =  @salary.ganancia_a_retener_por_mes
    @salario_de_bolsillo_with_especial_discounts = @salary.salario_neto_de_bolsillo

    @diferencia_ganancia_a_retener  = @salary.monthly_difference(@retained_tax_with_especial_discounts,@retained_tax)
    @diferencia_sueldo_de_bolsillo  = @salary.monthly_difference(@salario_de_bolsillo_with_especial_discounts,@salario_de_bolsillo)
    
    
    session[:salario_bolsillo] = @salario_de_bolsillo_with_especial_discounts
    session[:ganancia_retenida_mensual] =  @retained_tax_with_especial_discounts
    
    end   
    @mostrar_calcular_deducciones = true
  end
  
  def actualiza_cargo_rubro
   
  end
  
  def actualizar_cargo_rubro
     parametros = params[:salary]
     
     Salary.update_all ["cargo=?",parametros[:cargo_cambiado] ], ["cargo=? ",parametros[:cargo]]  
     Salary.update_all ["rubro_empresa=?",parametros[:rubro_cambiado]], ["rubro_empresa=? ",parametros[:rubro_empresa]]  
    
    
     redirect_to :action=> :actualiza_cargo_rubro, :method => :get
  end
  private
  
  def find_salary
    session[:salary] ||= Salary.new  
  end
  
  def clear_salary_y_positions
    session[:salary]  =   nil
    @positions= Position.find(:all, :select => "id, name", :order => "name DESC")
  end
  
  
end
