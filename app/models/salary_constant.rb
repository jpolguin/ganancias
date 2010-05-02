# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class SalaryConstant
  
  @@PORCENTAJE_DESCUENTO_OBRA_SOCIAL_Y_LEY = {}
  @@SUELDO_TOPE_PARA_OBRA_SOCIAL = {}
  @@SUELDO_TOPE_PARA_JUBILACION  = {}
  @@PORCENTAJE_DESCUENTO_JUBILACION = {}

  @@MINIMO_NO_IMPONIBLE =  {}
  @@DEDUCCION_ESPECIAL  = {}
  @@CONYUGE             = {}
  @@HIJO                = {}
  @@OTRAS_CARGAS        = 
  
  @@tope_obra_social={}
  @@tope_jubilacion={}
  @@porcentaje_obra_social = {}
  @@porcentaje_jubilacion = {}
  def initialize
  end
  
  
 def  self.tope_sueldo_obra_social(anio,mes)
     #puts "SALARY CONSTANT  tope obra social de #{mes}"
     @@SUELDO_TOPE_PARA_OBRA_SOCIAL[anio]||= obtener_parametro('SUELDO_TOPE_PARA_OBRA_SOCIAL', anio)
   
     if ( !@@tope_obra_social[indice(anio,mes)]) then
       @@tope_obra_social[indice(anio,mes)] = @@SUELDO_TOPE_PARA_OBRA_SOCIAL[anio].valor_para_mes(mes)
     end
     @@tope_obra_social[indice(anio,mes)]
 end
 
  def self.porcentaje_descuento_obra_social(anio,mes)
    #puts "entrando a descuento obra social"
    @@PORCENTAJE_DESCUENTO_OBRA_SOCIAL_Y_LEY[anio]||= obtener_parametro('PORCENTAJE_DESCUENTO_OBRA_SOCIAL_Y_LEY', anio)
    
    if (!@@porcentaje_obra_social[indice(anio,mes)]) then 
      @@porcentaje_obra_social[indice(anio,mes)] = @@PORCENTAJE_DESCUENTO_OBRA_SOCIAL_Y_LEY[anio].valor_para_mes(mes) * (-1)
    end
    @@porcentaje_obra_social[indice(anio,mes)]
   
  end
  
  def self.tope_sueldo_para_jubilacion(anio, mes)
    #puts "entrando a tope jubilacion de #{mes}"
    
    @@SUELDO_TOPE_PARA_JUBILACION[anio]||= obtener_parametro('SUELDO_TOPE_PARA_JUBILACION', anio)
    if ( !@@tope_jubilacion[indice(anio,mes)]) then
      @@tope_jubilacion[indice(anio,mes)] = @@SUELDO_TOPE_PARA_JUBILACION[anio].valor_para_mes(mes)
    end 
     @@tope_jubilacion[indice(anio,mes)]

  end
  
  def self.porcentaje_descuento_jubilacion(anio,mes)
    #puts "entrando a descuento jubilacionl"
    
      @@PORCENTAJE_DESCUENTO_JUBILACION[anio]||= obtener_parametro('PORCENTAJE_DESCUENTO_JUBILACION', anio)
    
    if (!@@porcentaje_jubilacion[indice(anio,mes)]) then 
      @@porcentaje_jubilacion[indice(anio,mes)] = @@PORCENTAJE_DESCUENTO_JUBILACION[anio].valor_para_mes(mes) * (-1)
    end
    @@porcentaje_jubilacion[indice(anio,mes)]
 
  end
  
  def self.minimo_no_imponible(anio)
#    if (!@@MINIMO_NO_IMPONIBLE[anio])
#      @@MINIMO_NO_IMPONIBLE[anio]= obtener_parametro('MINIMO_NO_IMPONIBLE', anio)
#    end
    (@@MINIMO_NO_IMPONIBLE[anio]||=obtener_parametro('MINIMO_NO_IMPONIBLE', anio)).value() * (-1)
    
  end
  
  def self.deduccion_especial(anio) 
    (@@DEDUCCION_ESPECIAL[anio]||= obtener_parametro('DEDUCCION_ESPECIAL', anio)).value() * (-1)
  end   
  
  def self.deduccion_por_hijo(anio)
    (@@HIJO[anio]||=obtener_parametro('HIJO', anio)).value() * (-1)
  end 

  def self.deduccion_otras_cargas(anio)
    (@@OTRAS_CARGAS[anio]||=obtener_parametro('OTRAS_CARGAS', anio)).value() * (-1)
  end 
  
  def self.deduccion_conyuge(anio)
     (@@CONYUGE[anio]||=obtener_parametro('CONYUGE', anio)).value() * (-1)
  end

  def self.indice(anio,mes)
    "#{anio}#{ mes}"
  end
  
  def self.obtener_parametro(nombre_parametro, anio)
    RevenueParameter.find(:first, :conditions => ["name = :name  and year=:anio" , {:name => nombre_parametro,:anio=> anio}])
  end
  
end
