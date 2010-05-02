class AddRevenueTaxes < ActiveRecord::Migration


  def self.up
  rangosTasasAnual =[]
  rangosTasasAnual[0] = {:from => 0.0, :to => 10000.0, :amount=> 0.0,:rate => 0.09}
  rangosTasasAnual[1] = {:from => 10000.0, :to => 20000.0, :amount=> 900.0,:rate => 0.14}
  rangosTasasAnual[2] = {:from => 20000.0, :to => 30000.0, :amount=> 2300.0,:rate => 0.19}
  rangosTasasAnual[3] = {:from => 30000.0, :to => 60000.0, :amount=> 4200.0,:rate => 0.23}
  rangosTasasAnual[4] = {:from => 60000.0, :to => 90000.0, :amount=> 11100.0,:rate => 0.27}
  rangosTasasAnual[5] = {:from => 90000.0, :to => 120000.0, :amount=> 19200.0,:rate => 0.31}
  rangosTasasAnual[6] = {:from => 120000.0, :to => 99999999.0, :amount=> 28500.0,:rate => 0.35}
    
    Salary::MONTHS.each() do |mes|
         num_mes = Salary::MONTHS.index(mes) + 1
         rangosTasasAnual.each { | rango_tasa|  
            RevenueTax.create(:month => mes,
              :from_salary=> convertir_a_mes( rango_tasa[:from], num_mes),
              :to_salary=> convertir_a_mes( rango_tasa[:to], num_mes),
              :tax_amount=> convertir_a_mes( rango_tasa[:amount], num_mes),
              :tax_rate=> rango_tasa[:rate]
            )
         }
    end  
 end

  
  def self.down
    RevenueTax.delete_all 
  end

private
  def self.convertir_a_mes(monto,numero_mes)
     (monto / 12.0) * numero_mes
  end

  
end
