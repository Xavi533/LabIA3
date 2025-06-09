(define (problem ricorico-ext3-generado)
  (:domain ricorico-ext3)
  
  (:objects
    ; Primeros
    paella espaguetis arroz-negro ensalada-mixta macarrones - primero
    
    ; Segundos
    pollo-asado filete-ternera calamar-romana pechuga-plancha bacalao-horno - segundo
    
    ; Días
    lunes martes miercoles jueves viernes - dia
    
    ; Tipos
    frito carne ensalada pasta pescado arroz - tipo-plato
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
    
    ; Incompatibilidades
    (incompatible espaguetis pollo-asado)
    (incompatible arroz-negro filete-ternera)
    (incompatible arroz-negro pechuga-plancha)
    (incompatible ensalada-mixta calamar-romana)
    (incompatible macarrones filete-ternera)
    (incompatible macarrones pechuga-plancha)
    
    ; Tipos de primeros
    (es-tipo-primero paella arroz)
    (es-tipo-primero espaguetis pasta)
    (es-tipo-primero arroz-negro arroz)
    (es-tipo-primero ensalada-mixta ensalada)
    (es-tipo-primero macarrones pasta)
    
    ; Tipos de segundos
    (es-tipo-segundo pollo-asado carne)
    (es-tipo-segundo filete-ternera carne)
    (es-tipo-segundo calamar-romana frito)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo bacalao-horno pescado)
    
    ; Plato obligatorio
    (primero-en-dia miercoles paella)
    (segundo-en-dia lunes pechuga-plancha)
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