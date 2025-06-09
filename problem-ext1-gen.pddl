(define (problem ricorico-ext1-generado)
  (:domain ricorico-ext1)
  
  (:objects
    ; Primeros platos
    sopa-verduras garbanzos arroz-negro tortilla-patatas paella - primero
    
    ; Segundos platos  
    pescadito-frito pollo-asado albondigas pechuga-plancha salmon-plancha - segundo
    
    ; Días
    lunes martes miercoles jueves viernes - dia
  )
  
  (:init
    ; Días sin menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Incompatibilidades
    (incompatible sopa-verduras pescadito-frito)
    (incompatible sopa-verduras pollo-asado)
    (incompatible garbanzos albondigas)
    (incompatible garbanzos pechuga-plancha)
    (incompatible garbanzos salmon-plancha)
    (incompatible arroz-negro pollo-asado)
    (incompatible arroz-negro pechuga-plancha)
    (incompatible paella pollo-asado)
    (incompatible paella albondigas)
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