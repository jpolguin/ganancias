class SpecialDiscount < ActiveRecord::Base
  validates_presence_of :month 
  validates_numericality_of :seguro_retiro, :seguro_vida, :cuota_medica, :donacion, :honorario_medico, :intereses_hipotecarios,:personal_domestico,:aportes_voluntarios_afjp
  
  
  belongs_to :salary
  
  
  def  self.new_from_data( mes, personal_domestico, intereses_hipotecarios, aportes_voluntarios_afjp, seguro_retiro, seguro_vida, cuota_medica, donacion, honorario_medico )
     new(:month => mes, :personal_domestico => personal_domestico , 
          :intereses_hipotecarios => intereses_hipotecarios , :aportes_voluntarios_afjp => aportes_voluntarios_afjp ,
          :seguro_retiro => seguro_retiro, :seguro_vida => seguro_vida, :cuota_medica => cuota_medica, :donacion => donacion,:honorario_medico => honorario_medico) 
  end

  
  
  
end
