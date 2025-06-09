(define (problem ricorico-ext3-joc1)
  (:domain ricorico-ext3)
  
  (:objects
    ; Platos primeros (paella es constante, no se declara aquí)
    sopa-verduras ensalada-mixta macarrones gazpacho paella - primero
    
    ; Platos segundos
    salmon-plancha fabada-asturiana pollo-asado filete-ternera merluza-salsa - segundo
    
    ; Días (jueves es constante, pero incluimos todos para el orden)
    lunes martes miercoles jueves viernes - dia
    
    ; Tipos de plato
    arroz sopa ensalada pasta - tipo-plato
    pescado legumbre carne - tipo-plato
  )
  (:init
    ; Días sin menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)

    ; Orden de días
    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)

    ; Tipos de primeros
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero fideos-marinera pasta)
    (es-tipo-primero tortilla-patatas huevo)
    (es-tipo-primero sopa-pescado sopa)
    (es-tipo-primero ensalada-mixta ensalada)
    (es-tipo-primero gazpacho sopa)

    ; Tipos de segundos
    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)
    (es-tipo-segundo hamburguesa carne)
    (es-tipo-segundo queso-cabra frito)
    (es-tipo-segundo salchichas carne)

    ; Ignoramos incompatibilidades en esta prueba

    ; Imposición del cliente: primeros
    (primero-en-dia lunes crema-calabaza)
    (primero-en-dia miercoles tortilla-patatas)
    (primero-en-dia viernes gazpacho)

    ; Imposición del cliente: segundos
    (segundo-en-dia martes bacalao-horno)
    (segundo-en-dia jueves albondigas-salsa)
  )

  (:goal 
    (and
      (dia-asignado lunes)
      (dia-asignado martes)
      (dia-asignado miercoles)
      (dia-asignado jueves)
      (dia-asignado viernes)
    )
  )
)