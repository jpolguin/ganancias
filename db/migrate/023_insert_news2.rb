class InsertNews2 < ActiveRecord::Migration
  def self.up
    
    InfoNew.create(:fecha=>"07/23/2008",:titulo=>"Cambio en el tope para descuento de Jubilacion",
                   :descripcion=>"Según la Resolución 2429 de la AFIP publicada el 27/03/2008 en el Boletín Oficial, el tope para calcular aportes al sistema de jubilaciones y pensiones que en marzo pasó de $6750 a $7256, a partir de este mes de julio/2008 pasará a $7800.",
                   :url_noticia=>"http://biblioteca.afip.gov.ar/gateway.dll/Normas/ResolucionesGenerales/reag01002429_2008_03_18.xml", 
                   :categoria=> InfoNew::CATEGORIA_NOTICIA_GANANCIA , :mostrar=> true)

    InfoNew.create(:fecha=>"07/23/2008",:titulo=>"Tabla de topes de descuentos jubilatorios y de Obra social",
                   :descripcion=>"Tabla de topes de sueldos sobre los cuales se calculan los descuentos de ley de salario, tanto Obra Social, Jubilacion y ley 19.032",
                   :url_noticia=>"http://biblioteca.afip.gov.ar/afipres/RG_AFIP_2429_2008_A001_V000.pdf", 
                   :categoria=> InfoNew::CATEGORIA_NOTICIA_GANANCIA , :mostrar=> true)

    
    InfoNew.create(:fecha=>"07/23/2008",:titulo=>"Cambio en el tope para descuento de Jubilacion",
                   :descripcion=>"Según la Resolución 2429 de la AFIP publicada el 27/03/2008 en el Boletín Oficial, el tope para calcular aportes al sistema de jubilaciones y pensiones que en marzo pasó de $6750 a $7256, a partir de este mes de julio/2008 pasará a $7800.",
                   :url_noticia=>"http://biblioteca.afip.gov.ar/gateway.dll/Normas/ResolucionesGenerales/reag01002429_2008_03_18.xml", 
                   :categoria=> InfoNew::CATEGORIA_NOTICIA_SUELDO , :mostrar=> true)


    InfoNew.create(:fecha=>"07/23/2008",:titulo=>"Nota Clarin sobre Busqueda de trabajo en Internet.",
                   :descripcion=>"La periodista explica algunas estrategias para buscar trabajo usando Internet. Varios links para busqueda de trabajo, algunos no actualizados o no funcionan mas. ",
                   :url_noticia=>"http://www.clarin.com/suplementos/informatica/2005/06/22/f-999931.htm", 
                   :categoria=> InfoNew::CATEGORIA_NOTICIA_SUELDO , :mostrar=> true)

    
    
    InfoNew.create(:fecha=>"07/20/2008",
                   :titulo=>"Execuzone Argentina", :descripcion=>"Busqueda de trabajo para profesionales y ejecutivos",
                   :url_noticia=>"http://empleos.execuzone.com/index.php/pais/1/Argentina", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)    

    InfoNew.create(:fecha=>"07/21/2008",
                   :titulo=>"Centro de teletrabajo de Facultad de Ciencias Sociales", :descripcion=>"Links e informacion sobre teletrabajo en Argentina, buenas paginas con mucha informacion y links.",
                   :url_noticia=>"http://www.caminandoutopias.org.ar/", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)    

    InfoNew.create(:fecha=>"07/22/2008",
                   :titulo=>"Centro de Empleo.com", :descripcion=>"Sitio de busqueda genérico de trabajo. Se encuentra en Idioma Ingles.",
                   :url_noticia=>"http://www.centrodeempleos.com/", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)    

    
    
  end

  def self.down
  end
end
