class AddNews1 < ActiveRecord::Migration
  def self.up
    InfoNew.create(:fecha=>"05/17/2008",:titulo=>"Explican cambios para calcular la retencion de Ganancias en salarios ",:descripcion=>"A partir de este mes, la quita mensual no podra superar el 35% de la remuneracion bruta que los empleados perciben en dinero. Asimismo el empleado debera presentar la declaracion jurada anual y pagar la diferencia del impuesto cuando se produzca un error imputable al empleador",:url_noticia=>"http://contadores.infobaeprofesional.com/notas/66248-Explican-cambios-para-calcular-la-retencion-de-Ganancias-en-salarios.html?cookie", :categoria=> InfoNew::CATEGORIA_NOTICIA_GANANCIA , :mostrar=> true)
    InfoNew.create(:fecha=>"10/17/2007",:titulo=>"Con $2 menos al mes se pagan $7000 menos de ganancia anual",:descripcion=>"Debido al efecto de la tabla'Peirano' disminuyendo el sueldo en 2 pesos se cambia de categoria de descuentos y se retienen hasta 7000 menos al año." ,:url_noticia=>"http://www.fecliba.org.ar/index/home/documentacion/Impositivos07/parrafosDownloads/0111111111111111113/document/Efectos%20de%20la%20tabla%20Peirano.pdf", :categoria=> InfoNew::CATEGORIA_NOTICIA_GANANCIA , :mostrar=> true)    
    InfoNew.create(:fecha=>"07/28/2007",:titulo=>"Se pagara menos por el impuesto a las ganancias",:descripcion=>"Eliminan parte de la tablita de Machinea; salarios anuales hasta $ 91.000, sin descuentos" ,:url_noticia=>"http://www.lanacion.com.ar/nota.asp?nota_id=929715", :categoria=> InfoNew::CATEGORIA_NOTICIA_GANANCIA , :mostrar=> true)    
    InfoNew.create(:fecha=>"07/01/2007",:titulo=>"INSTRUCTIVO FORMULARIO F-572",:descripcion=>"DEDUCCIONES ADMITIDAS PARA IMPUESTO A LAS GANANCIA. Como llenar el formulario F-572" ,:url_noticia=>"http://webdga.ec.gba.gov.ar/pdf/afip/instructivo_formulario572.pdf", :categoria=> InfoNew::CATEGORIA_NOTICIA_GANANCIA , :mostrar=> true)    
    
    InfoNew.create(:fecha=>"03/05/2008",:titulo=>"Cuanto se paga en el mercado de tecnologia",:descripcion=>"Estadistica de Bumeran (fuente Bumeran) sobre algunos puestos del mercado de tecnologia y sistemas " ,:url_noticia=>"http://www.bumeran.com.ar/articulos_empresas/28/82420/cuantosepagahoyenelmercadodetecnologia.html", :categoria=> InfoNew::CATEGORIA_NOTICIA_SUELDO , :mostrar=> true)    
    InfoNew.create(:fecha=>"07/07/2005",:titulo=>"Pequeño resumen de sueldos ofrecidos año 2005",:descripcion=>"Lista de sueldos ofrecidos en base a ofertas en Bumeran (fuente Bumeran) de puestos de trabajo de algunos sectores" ,:url_noticia=>"http://www.bumeran.com.ar/articulos_empresas/28/73060/cuantosepaga.html", :categoria=> InfoNew::CATEGORIA_NOTICIA_SUELDO , :mostrar=> true)    
    InfoNew.create(:fecha=>"04/17/2007",:titulo=>"Las  software factory  recalientan el mercado laboral IT argentino",:descripcion=>"Las empresas se pelean por llevarse los pocos profesionales disponibles pagándoles salarios en dólares" ,:url_noticia=>"http://www.lanacion.com.ar/nota.asp?nota_id=797228", :categoria=> InfoNew::CATEGORIA_NOTICIA_SUELDO , :mostrar=> true)    
    
  
    InfoNew.create(:fecha=>"03/01/2008",:titulo=>"BUSQUEDA DE TRABAJO EN BUMERAN",:descripcion=>"http://www.bumeran.com.ar",:url_noticia=>"http://www.bumeran.com.ar", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)    
    InfoNew.create(:fecha=>"03/02/2008",:titulo=>"BUSQUEDA DE TRABAJO EN Universo Bit",:descripcion=>"http://www.universobit.com/",:url_noticia=>"http://www.universobit.com/", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)    
    InfoNew.create(:fecha=>"03/03/2008",:titulo=>"BUSQUEDA DE TRABAJO EN COMPUTRABAJO",:descripcion=>"http://www.computrabajo.com.ar/",:url_noticia=>"http://www.computrabajo.com.ar/", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)    
    InfoNew.create(:fecha=>"03/04/2008",:titulo=>"BUSQUEDA DE TRABAJO EN ZONA JOBS",:descripcion=>"http://www.zonajobs.com.ar/ ",:url_noticia=>"http://www.zonajobs.com.ar/", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)    
    InfoNew.create(:fecha=>"03/05/2008",:titulo=>"BUSQUEDA DE TRABAJO EN EMPLEOS IT",:descripcion=>"http://www.empleosit.com/",:url_noticia=>"http://www.empleosit.com/", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)     
    InfoNew.create(:fecha=>"03/06/2008",:titulo=>"BUSQUEDA DE TRABAJO SITIOS OFICIALES ",:descripcion=>"Busqueda de trabajo del Ministerio de Trabajo",:url_noticia=>"http://www.trabajo.gov.ar/busqueda/busqueda.htm ", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)     
    InfoNew.create(:fecha=>"03/07/2008",:titulo=>"Sitio Bolsa de Trabajo  ",:descripcion=>"Bolsa de trabajo de varios sectores y sitios internet",:url_noticia=>"http://tusbuscadores.com/trabajo/", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)     
    InfoNew.create(:fecha=>"03/08/2008",:titulo=>"BUSQUEDA DE TRABAJO E INFORMACION PARA SECRETARIAS",:descripcion=>"Sitio que contiene noticias y articulos de interes para secretarias y asistentes y hay ademas avisos de trabajo.",:url_noticia=>"http://www.secretariasenred.com/ofertas.htm", :categoria=> InfoNew::CATEGORIA_BUSQUEDA_TRABAJO , :mostrar=> true)     

    
  end

  def self.down
    InfoNew.delete_all  
  end
end
