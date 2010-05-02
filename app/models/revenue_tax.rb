class RevenueTax < ActiveRecord::Base
  
  def self.total_tax(month,net_revenue_amount)
    if (net_revenue_amount <= 0.0) 
      0.0
    else
      tasa_a_aplicar = find_applied_tax(month,net_revenue_amount)
      tasa_a_aplicar["tax_amount"]+
                (tasa_a_aplicar["tax_rate"] * (net_revenue_amount - tasa_a_aplicar["from_salary"]) )
    end
    
  end
  
  def self.find_applied_tax(month, amount)
    taxes = RevenueTax.find(:all, :select => "tax_amount, tax_rate, from_salary", 
                    :conditions => ["month = :mes and  from_salary <= :amount and :amount <= to_salary  " ,
                    {:mes => month, :amount=> amount}])
   return taxes[0]
  end
  
  
  
end
