// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function copiar_a_derecha(element, value) {
    
    debe_copiar_a_derecha = document.getElementById('copiar_a_derecha');
    if (debe_copiar_a_derecha.checked) {
        parentesis_izquierdo =  element.id.indexOf('[');
        parentesis_derecho = element.id.indexOf(']');
        indice_modificado = element.id.substring(parentesis_izquierdo+1,parentesis_derecho)

        cabeza_elemento = element.id.substring(0,parentesis_izquierdo+1);
        cola_elemento = element.id.substring(parentesis_derecho, element.id.length);

        inicio = 1.0 +  parseInt(indice_modificado);
        for(i= inicio ; i<12 ;i++ ) {
            var id_a_copiar = cabeza_elemento+i+cola_elemento;
          //  alert(':' + element.id + " va copiar a="+ id_a_copiar);
            elemento_a_copiar  = document.getElementById(id_a_copiar);
            elemento_a_copiar.value = value;


       }
    }
}
