class InfoNew < ActiveRecord::Base
  CATEGORIA_NOTICIA_GANANCIA = "categoria_ganancia"
  CATEGORIA_NOTICIA_SUELDO = "categoria_sueldo"
  CATEGORIA_BUSQUEDA_TRABAJO = "categoria_busqueda_trabajo"
  
    
  
  def self.find_noticias_ganancia
    InfoNew.find(:all,
                  :conditions => "categoria = 'categoria_ganancia'" ,
                  :order => "fecha DESC" ,
                  :limit => 20)
  end
  
  
  def self.find_noticias_sueldo
    InfoNew.find(:all,
                  :conditions => "categoria = 'categoria_sueldo'" ,
                  :order => "fecha DESC" ,
                  :limit => 20)
  end
  
  def self.find_busqueda_trabajo
    InfoNew.find(:all,
                  :conditions => "categoria = 'categoria_busqueda_trabajo'" ,
                  :order => "fecha DESC" ,
                  :limit => 25)
  end
  
  
end
