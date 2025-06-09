(define (problem ricorico-ext2-joc1)
  (:domain ricorico-ext2)
  
  (:objects
    ; Platos primeros
    paella arroz-tres-delicias bol-arroz sopa-verduras gazpacho   - primero
    
    ; Platos segundos
    salmon-plancha sashimi merluza-salsa pollo-asado filete-ternera - segundo
    
    ; Días
    lunes martes miercoles jueves viernes - dia
    
    ; Tipos de plato
    arroz sopa ensalada pasta - tipo-plato
    pescado legumbre carne - tipo-plato
  )
  
  (:init
    ; Días necesitan menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; NUEVO: Definir orden de días
    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Tipos de primeros platos
    (es-tipo-primero paella arroz)
    (es-tipo-primero sopa-verduras sopa)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero gazpacho sopa)
    (es-tipo-primero bol-arroz arroz)
    
    
    ; Tipos de segundos platos
    (es-tipo-segundo salmon-plancha pescado)
    (es-tipo-segundo pollo-asado carne)
    (es-tipo-segundo sashimi pescado)
    (es-tipo-segundo filete-ternera carne)
    (es-tipo-segundo merluza-salsa pescado)
  )

  (:goal 
    (and
      ; Todos los días deben tener menú asignado
      (dia-asignado lunes)
      (dia-asignado martes)
      (dia-asignado miercoles)
      (dia-asignado jueves)
      (dia-asignado viernes)
    )
  )
)