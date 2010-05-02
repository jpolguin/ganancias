class ReductionTax < ActiveRecord::Base
  
  def self.find_reduction_tax(mes, salary_amount)
   taxes= ReductionTax.find(:all, :select => "reduction_percentage", 
                    :conditions => ["month = :mes and  from_salary <= :amount and :amount <= to_salary  " ,
                    {:mes => mes, :amount=> salary_amount}])
   taxes[0]["reduction_percentage"]
  end
  
end
