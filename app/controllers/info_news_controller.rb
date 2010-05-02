class InfoNewsController < ApplicationController
  
  
  def tabla_deducciones_ganancias
    @deducc_directas =[]
    
    
    @deducc_directas[0] = {:concepto => "Ganancia no imponible", :norma =>"ART 23, inc A", :valor=>9000,:aclaracion=>"Solo si es residente."}
    @deducc_directas[1] = {:concepto => "Deduccion por conyuge", :norma =>"ART 23, inc B", :valor=>10000, :aclaracion=>"Residente en pais y no trabaje en rel.dependencia."}
    @deducc_directas[2] = {:concepto => "Deduccion por Hijo", :norma =>"ART 23, inc B", :valor=>5000, :aclaracion=>"Hijo, hijastra/o, menor de 24 años o incapacitado para el trabajo"}
    @deducc_directas[3] = {:concepto => "Otras cargas", :norma =>"ART 23, inc B", :valor=>3750, :aclaracion=>"Descendiente (Nieto/nieta, Bisnieto/a), ascendiente ( padre, madre, abuelo/a), Hermano/a, suegro/a con ingresos menores 7500 anual."}
    @deducc_directas[4] = {:concepto => "Deduccion especial", :norma =>"ART 23, inc C, parrafo 3", :valor=>43200, :aclaracion=>"9000 para gan. empresas pero el importe sube 3.8 veces cuando se trate de ganancias a que se refieren incisos a,b y c del articulo 79 con limitaciones del ultimo parrafo art. 23. "}    
    @deducc_directas[5] = {:concepto => "Gastos de Sepelio", :norma =>"ART 22.", :valor=>996.23, :aclaracion=>"N/A"}    
    @deducc_directas[6] = {:concepto => "Empresas", :norma =>"ART. 23, INC. C), 1° PARRAFO", :valor=>9000, :aclaracion=>"Empresas, siempre que trabaje personalmente en las mismas (art. 49) o cuando se trate de ganancias netas incluidas en el artículo 79"}    

    @deducc_generales =[]    
    
    @deducc_generales[0] = {:concepto => "Intereses Hipotecarios", :norma =>"ART. 81, INC. A", :valor=>20000, :aclaracion=>"INTERESES PAGADOS DE CRÉDITO HIPOTECARIO PARA ADQUIRIR INMUEBLE (CASA - HABITACIÓN)"}
    @deducc_generales[1] = {:concepto => "Prima Seguro de vida", :norma =>"ART. 81, INC. B)", :valor=>996.23, :aclaracion=>"Seguro de vida por fallecimiento."}
    @deducc_generales[2] = {:concepto => "Donaciones ", :norma =>"ART. 81, INC. C)", :valor=>"Ver descripcion =>",:aclaracion=>"DONACIONES A FISCOS NACIONAL, PROVINCIALES Y MUNICIPALES,ETC. HASTA EL 5% DE LA GANANCIA NETA DEL EJERCICIO."}  
    @deducc_generales[3] = {:concepto => "Aportes voluntarios AFJP", :norma =>"ART. 81, INC. D)", :valor=>"El importe pagado.",:aclaracion=>"FONDOS DE JUBILACIONES, RETIROS, PENSIONES O SUBSIDIOS."}
    @deducc_generales[4] = {:concepto => "Retiro privado", :norma =>"ART. 81, INC. E)", :valor=>"1.261.16",:aclaracion=>"APORTES PERSONALES CORRESPONDIENTES A PLANES DE RETIRO PRIVADO "}
    @deducc_generales[5] = {:concepto => "Aportes obligatorios a obra social ", :norma =>"ART. 81, INC. G) 1er Parrafo", :valor=>"El importe pagado",:aclaracion=>"En general ya se descuenta del recibo de sueldo, en relacion de dependencia."}
    @deducc_generales[6] = {:concepto => "Cuotas a prepagas", :norma =>"ART. 81, INC. G) 2do. Parrafo", :valor=>"hasta el 5% de la ganancia neta.",:aclaracion=>"CUOTAS A INSTITUCIONES QUE PRESTEN COBERTURA MEDICO ASISTENCIALES ART. 81, INC. G), 2° PÁRRAFO HASTA EL 5% DE LA GANANCIA NETA DEL EJERCICIO"}
    @deducc_generales[7] = {:concepto => "Honorarios medicos y paramedicos", :norma =>"ART. 81, INC. H)", :valor=>"ver aclaracion =>",:aclaracion=>"HASTA EL 40% DE LO FACTURADO, SIEMPRE QUE NO SUPERE EL 5% DE LA GANANCIA NETA DEL EJERCICIO. En algunas empresas tambien toman gastos de  medicamentos lo cual es incorrecto."}
    @deducc_generales[8] = {:concepto => "Servicio Domestico", :norma =>"ART. 16, LEY 26063", :valor=>9000,:aclaracion=>"RETRIBUCIÓN PAGADA Y CONTRIBUCIÓN OBLIGATORIA INGRESADA POR EL EMPLEADOR"}
    
    
  end
  
  def links_ganancia
    @noticias = []
    @noticias = InfoNew.find_noticias_ganancia
    
#    @noticias[0] = {:titulo=>"Explican cambios para calcular la retención de Ganancias en salarios ",:descripcion=>"A partir de este mes, la quita mensual no podrá superar el 35% de la remuneración bruta que los empleados perciben en dinero. Asimismo el empleado deberá presentar la declaración jurada anual y pagar la diferencia del impuesto cuando se produzca un error imputable al empleador",:url_noticia=>"http://contadores.infobaeprofesional.com/notas/66248-Explican-cambios-para-calcular-la-retencion-de-Ganancias-en-salarios.html?cookie", :fecha=>"17/05/2008"}
#    @noticias[1] = {:titulo=>"Con $2 menos al mes se pagan $7000 menos de ganancia anual",:descripcion=>"Debido al efecto de la tabla'Peirano' disminuyendo el sueldo en 2 pesos se cambia de categoria de descuentos y se retienen hasta 7000 menos al año." ,:url_noticia=>"http://www.fecliba.org.ar/index/home/documentacion/Impositivos07/parrafosDownloads/0111111111111111113/document/Efectos%20de%20la%20tabla%20Peirano.pdf", :fecha=>"17/10/2007"}
#    @noticias[2] = {:titulo=>"Se pagará menos por el impuesto a las ganancias",:descripcion=>"Eliminan parte de la tablita de Machinea; salarios anuales hasta $ 91.000, sin descuentos" ,:url_noticia=>"http://www.lanacion.com.ar/nota.asp?nota_id=929715", :fecha=>"28/07/2007"}
#    @noticias[3] = {:titulo=>"INSTRUCTIVO FORMULARIO F-572",:descripcion=>"DEDUCCIONES ADMITIDAS PARA IMPUESTO A LAS GANANCIA. Como llenar el formulario F-572" ,:url_noticia=>"http://webdga.ec.gba.gov.ar/pdf/afip/instructivo_formulario572.pdf", :fecha=>"01/07/2007"}
#    

    
  end
  
  def noticias_sueldo
    @noticias = []
    @noticias = InfoNew.find_noticias_sueldo
    
  end
  
  def busqueda_trabajo
    @noticias = []
    @noticias = InfoNew.find_busqueda_trabajo
    
  end
  
end
