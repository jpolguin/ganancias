class ReportsController < ApplicationController
  layout "reports", :except => ["sueldo_bolsillo_anual" ,  "grafico_estadistica_por_cargo"] 


  def index
  end

  def sueldo_bolsillo_anual
    @sueldo_bolsillo  = session[:salario_bolsillo]
    @ganancia_retenida = session[:ganancia_retenida_mensual] 
      
  end
  
  def estadisticas_por_cargo
    
  end
  
  def grafico_estadistica_por_cargo
    @ganancia_bruta_por_cargo = Salary.find_by_sql "SELECT rubro_empresa, avg(gross_salary) sueldo FROM salaries s, monthly_salaries ms  where ms.salary_id = s.id and ms.month like '%mayo%' and ms.gross_salary > 8000 and ms.gross_salary < 12000  group by rubro_empresa  having count(*) > 5 order by sueldo desc "
  end
end
