(define (problem ricorico-ext3-joc2)
  (:domain ricorico-ext3)
  
  (:objects
    ; Platos primeros (paella es constante)
    crema-calabaza lentejas-estofadas arroz-tres-delicias tortilla-patatas paella - primero
    
    ; Platos segundos
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
    ; Días (jueves es constante)
    lunes martes miercoles jueves viernes - dia
    
    ; Tipos de plato
    arroz crema legumbre huevo - tipo-plato
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
    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Incompatibilidades
    
    
    ; Tipos de primeros platos
    (es-tipo-primero paella arroz)
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero tortilla-patatas huevo)
    
    ; Tipos de segundos platos
    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)

    ; NUEVO: Asignación de platos a días
    (primero-en-dia lunes paella)
    (segundo-en-dia martes bacalao-horno)
    (segundo-en-dia miercoles pechuga-plancha)
    (primero-en-dia viernes tortilla-patatas)

    (primero-usado paella)
    (segundo-usado bacalao-horno)
    (segundo-usado pechuga-plancha)
    (primero-usado tortilla-patatas)

    (dia-tiene-tipo-primero lunes arroz)
    (dia-tiene-tipo-segundo martes pescado)
    (dia-tiene-tipo-segundo miercoles carne)
    (dia-tiene-tipo-primero viernes huevo)
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