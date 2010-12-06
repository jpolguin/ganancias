class EstadisticasOctubreNoviembre2010 < ActiveRecord::Migration
  def self.up
      execute "INSERT INTO estadistica_por_rubro_mes  (rubro_empresa, salario_promedio, mes,anio)  " +
     " SELECT rubro_empresa as rubro_empresa, avg(gross_salary) as  salario_promedio, 'octubre' as mes , '2010' as anio FROM salaries s, monthly_salaries ms " + 
     " where ms.salary_id = s.id and ms.month like '%mayo%' and rubro_empresa <> 'ninguno' and rubro_empresa <> 'ninguna' and rubro_empresa <> 'niguno'   and " +
    " gross_salary > 3000 and gross_salary < 65000  and (extract(month from fecha_calculo)) = 10  " +
    "  group by rubro_empresa    having count(*) > 10 "

    execute "INSERT INTO estadistica_por_cargo_mes  (cargo, salario_promedio, mes,anio)  " +
     "  SELECT  cargo as cargo, avg(gross_salary) as  salario_promedio, 'octubre' as mes , '2010' as anio FROM salaries s, monthly_salaries ms " + 
    " where ms.salary_id = s.id and ms.month like '%mayo%' and cargo <> 'ninguno' and cargo <> 'ninguna' and cargo <> 'niguno'  and " + 
    " gross_salary > 3000 and gross_salary < 65000  and (extract(month from fecha_calculo)) = 10 " + 
    " group by cargo having count(*) > 3 "


    execute "INSERT INTO estadistica_por_rubro_mes  (rubro_empresa, salario_promedio, mes,anio)  " +
     " SELECT rubro_empresa as rubro_empresa, avg(gross_salary) as  salario_promedio, 'noviembre' as mes , '2010' as anio FROM salaries s, monthly_salaries ms " + 
     " where ms.salary_id = s.id and ms.month like '%mayo%' and rubro_empresa <> 'ninguno' and rubro_empresa <> 'ninguna' and rubro_empresa <> 'niguno'   and " +
    " gross_salary > 3000 and gross_salary < 65000  and (extract(month from fecha_calculo)) = 11  " +
    "  group by rubro_empresa   having count(*) > 10 "

    execute "INSERT INTO estadistica_por_cargo_mes  (cargo, salario_promedio, mes,anio)  " +
     "  SELECT  cargo as cargo, avg(gross_salary) as  salario_promedio, 'noviembre' as mes , '2010' as anio FROM salaries s, monthly_salaries ms " + 
    " where ms.salary_id = s.id and ms.month like '%mayo%' and cargo <> 'ninguno' and cargo <> 'ninguna' and cargo <> 'niguno'  and " + 
    " gross_salary > 3000 and gross_salary < 65000 and (extract(month from fecha_calculo)) = 11 " + 
    " group by cargo having count(*) > 3 "

                  
  end

  def self.down
     EstadisticaPorRubroMes.delete_all   "mes = 'octubre' and anio = '2010'"
     EstadisticaPorCargoMes.delete_all  "mes = 'octubre' and anio = '2010'"     
     EstadisticaPorRubroMes.delete_all   "mes = 'noviembre' and anio = '2010'"
     EstadisticaPorCargoMes.delete_all  "mes = 'noviembre' and anio = '2010'"     

  end
end
