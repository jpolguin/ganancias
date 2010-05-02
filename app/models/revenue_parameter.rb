class RevenueParameter < ActiveRecord::Base
  
   has_many :revenue_parameter_details

  
 def valor_para_mes(mes)
    #TODO tirar exception, crear la clase y raise.
    #if has_detail? 
      #puts "Entrando en valor por mes "
      detail = revenue_parameter_details.find( :first, :select =>"value",  :conditions =>[ "month = :mes", {:mes => mes}] )
      #puts " Despues de buscar el detail "
      #detail = revenue_parameter_details.select { |param| param.month.to_s =~ /#{mes}/  }
      detail["value"]
    #else
    #  raise PARAMETERS_HAS_NO_DETAIL_EXCEPTION.new()
      
    #end  
  end



end
