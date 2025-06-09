(define (problem ricorico-ext2-joc2)
  (:domain ricorico-ext2)
  
  (:objects
    ; Platos primeros
    crema-calabaza lentejas-estofadas arroz-tres-delicias fideos-marinera tortilla-patatas - primero
    
    ; Platos segundos
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
    ; Días
    lunes martes miercoles jueves viernes - dia
    
    ; Tipos de plato
    crema legumbre arroz pasta huevo - tipo-plato
    pescado carne frito - tipo-plato
  )
  
  (:init
     ; Días sin menú aún
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

    ; Incompatibilidades (se evita que estén juntos en un mismo día)
    (incompatible lentejas-estofadas albondigas-salsa)
    (incompatible tortilla-patatas calamar-romana)
    (incompatible fideos-marinera cordero-asado)

    ; Tipos de primeros platos
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero fideos-marinera pasta)
    (es-tipo-primero tortilla-patatas huevo)
    ; Algunos primeros comparten tipo con segundos
    (es-tipo-primero tortilla-patatas frito)         ; huevo y frito
    (es-tipo-primero lentejas-estofadas carne)       ; legumbre y carne

    ; Tipos de segundos platos
    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)
    ; Algunos segundos comparten tipo con primeros
    (es-tipo-segundo calamar-romana huevo)
    (es-tipo-segundo albondigas-salsa legumbre)
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