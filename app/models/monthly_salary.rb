class MonthlySalary < ActiveRecord::Base
  validates_presence_of :month, :gross_salary
  validates_numericality_of :gross_salary, :ticket, :bonus
  
  belongs_to :salary
  
  
  def  self.new_from_data( mes, sueldo_bruto, ticket, bonus)
     new(:month => mes, :gross_salary => sueldo_bruto , 
          :ticket => ticket , :bonus => bonus) 
  end
  
end
