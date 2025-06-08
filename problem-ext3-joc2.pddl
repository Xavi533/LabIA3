(define (problem ricorico-ext3-joc2)
  (:domain ricorico-ext3)
  
  (:objects
    ; Platos primeros (paella es constante)
    crema-calabaza lentejas-estofadas arroz-tres-delicias tortilla-patatas - primero
    
    ; Platos segundos
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
    ; Días (jueves es constante)
    lunes martes miercoles viernes - dia
    
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
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Incompatibilidades
    (incompatible paella albondigas-salsa)
    (incompatible paella cordero-asado)
    (incompatible lentejas-estofadas albondigas-salsa)
    (incompatible tortilla-patatas calamar-romana)
    (incompatible crema-calabaza cordero-asado)
    
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