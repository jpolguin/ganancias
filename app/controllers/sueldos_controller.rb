class SueldosController < ApplicationController

  def index
  end
  
  
  def terminos_de_uso
    @termino1 = "El objetivo de este sitio es brindar acceso a calculo de ganancias e informacion acerca de sueldos que debe ser publica y gratuita para todos. Los calculos se han realizado con consulta a profesionales,  y  con valores actualizados de alicuotas y descuentos, pero por un lado puede haber diferencia de criterios respecto a interpretacion de descuentos y calculos a realizar y por otro lado como el algoritmo se sigue para un caso general no toman en cuenta situaciones especiales o diferencias de reglamentaciones o convenios colectivos de trabajo razon por la cual puedan dar diferencias significativas con calculos mas detallados. Se le permite leer, acceder  y  consultar toda la información y calculos provistos en este sitio para uso y provecho personal, invididual y no comercial en la forma en que esta presentada, no aceptandose ningun pedido de cambio, alteracion de la misma o quejas por el contenido. "
    @termino2 = "Esta prohibida la utilizacion de  la informacion y calculo de este sitio para cualquier fin comercial, venta o  reventa de la informacion o calculos aqui provistos."
    @termino3 = "Cualquiera de los resultados y valores  mostrados o calculados, el calculo de ganancias neta y bruta, los descuentos y el sueldo de bolsillo tanto mensual como anual son puramente  indicativos y orientativos,  estimados en base a algoritmos de calculos propios no provenientes de ninguna fuente oficial y de ninguna forma ni bajo ningun concepto deben tomarse como verdaderos o  exactos  , ni seran comparables con aquellos calculos que la/s empresas, individuos  u organismos del estado realicen. Ante cualquier discrepancia, diferencia o duda consulte con su contador, departamento de RRHH o personal o profesional idóneo."
    @termino4 = "Los creadores y contribuyentes de este sitio web  no se responsabilizan por la mala o incorrecta utilización de los valores aquí calculados ni aceptan ninguna responsabilidad legal por cualquier pérdida,  daño  o litigaciones derivadas o relacionadas de cualquier manera con el uso de la información,  funcionalidad y calculos provistos por este sitio , ya sea directa o indirectamente, incluyendo, sin ninguna limitación, los daños por pérdida de negocio, pérdida de beneficios, interrupción del negocio, pérdida de la información del negocio, perdida de trabajo u oportunidad laboral o cualquier otra pérdida económica o consecuente (incluso en el caso de que nos hayas comunicado la posibilidad de que se produjera dicha pérdida o daño)."
  end
end