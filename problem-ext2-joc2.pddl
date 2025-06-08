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
    ; Días necesitan menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Definir orden de días
    (primero-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Incompatibilidades
    (incompatible lentejas-estofadas albondigas-salsa)
    (incompatible tortilla-patatas calamar-romana)
    (incompatible fideos-marinera cordero-asado)
    
    ; Tipos de primeros platos
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero fideos-marinera pasta)
    (es-tipo-primero tortilla-patatas huevo)
    
    ; Tipos de segundos platos
    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)
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