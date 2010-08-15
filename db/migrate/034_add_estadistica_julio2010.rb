class AddEstadisticaJulio2010 < ActiveRecord::Migration
  def self.up
    execute "INSERT INTO estadistica_por_rubro_mes  (rubro_empresa, salario_promedio, mes,anio)  " +
     " SELECT rubro_empresa as rubro_empresa, avg(gross_salary) as  salario_promedio, 'julio' as mes , '2010' as anio FROM salaries s, monthly_salaries ms " + 
     " where ms.salary_id = s.id and ms.month like '%mayo%' and rubro_empresa <> 'ninguno' and " +
    " gross_salary > 3000 and gross_salary < 59000 and rubro_empresa <> 'IBM'  " +
    "  group by rubro_empresa    having count(*) > 25 "

    execute "INSERT INTO estadistica_por_cargo_mes  (cargo, salario_promedio, mes,anio)  " +
     "  SELECT  cargo as cargo, avg(gross_salary) as  salario_promedio, 'julio' as mes , '2010' as anio FROM salaries s, monthly_salaries ms " + 
    " where ms.salary_id = s.id and ms.month like '%mayo%' and cargo <> 'ninguno' and " + 
    " gross_salary > 3000 and gross_salary < 59000 and cargo <> 'IBM' " + 
    " group by cargo having count(*) > 10 "

    
  end

  def self.down
     EstadisticaPorRubroMes.delete_all   "mes = 'julio' and anio = '2010'"
     EstadisticaPorCargoMes.delete_all  "mes = 'julio' and anio = '2010'"     
  end
end
