class AddReductionTaxes < ActiveRecord::Migration
  def self.up
    ReductionTax.delete_all  
    total_rango_0_porciento_d = 0.0
    total_rango_0_porciento_h = 91000.0
    
    total_rango_50_porciento_d = 91000.0
    total_rango_50_porciento_h = 130000.0
    
    total_rango_70_porciento_d = 130000.0
    total_rango_70_porciento_h = 195000.0  
    
    total_rango_90_porciento_d = 195000.0
    total_rango_90_porciento_h = 221000.0  
    
    total_rango_100_porciento_d = 221000.0  
    total_rango_100_porciento_h = 99999999.0  

    
    Salary::MONTHS.each() do |mes|
      num_mes = Salary::MONTHS.index(mes) + 1
      
      ReductionTax.create(:month=>mes, :from_salary => ((total_rango_0_porciento_d / 12) * num_mes),
                          :to_salary => ((total_rango_0_porciento_h / 12) * num_mes) ,
                          :reduction_percentage => 0.0 )
      
          
      ReductionTax.create(:month => mes, :from_salary=> ((total_rango_50_porciento_d / 12) * num_mes) ,
                          :to_salary => ((total_rango_50_porciento_h / 12) * num_mes) , 
                          :reduction_percentage => 0.5 )
                        
      ReductionTax.create(:month => mes, :from_salary=> ((total_rango_70_porciento_d / 12) * num_mes) ,
                          :to_salary => ((total_rango_70_porciento_h / 12) * num_mes) , 
                          :reduction_percentage => 0.7 )
                        
      ReductionTax.create(:month => mes, :from_salary=> ((total_rango_90_porciento_d / 12) * num_mes) ,
                          :to_salary => ((total_rango_90_porciento_h / 12) * num_mes) , 
                          :reduction_percentage => 0.9 )
                        
      ReductionTax.create(:month => mes, :from_salary=> ((total_rango_100_porciento_d / 12) * num_mes) ,
                          :to_salary => ((total_rango_100_porciento_h / 12) * num_mes) , 
                          :reduction_percentage => 1.0 )
      
      
      
     end
  end

  def self.down
    ReductionTax.delete_all  
  end

  
  
end
