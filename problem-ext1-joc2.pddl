(define (problem ricorico-ext1-joc2)
  (:domain ricorico-ext1)
  
  (:objects
    ; Exactamente 5 primeros y 5 segundos para forzar uso único
    crema-calabaza lentejas-estofadas arroz-tres-delicias fideos-marinera tortilla-patatas - primero
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
    ; Días laborables
    lunes martes miercoles jueves viernes - dia
  )
  
  (:init
    ; Todos los días necesitan menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Incompatibilidades estratégicas para asegurar solución
    ; Reducidas respecto al base para garantizar que existe solución
    (incompatible lentejas-estofadas albondigas-salsa)
    (incompatible tortilla-patatas calamar-romana)
    (incompatible fideos-marinera cordero-asado)
    
    ; Los platos empiezan sin usar (implícito por ausencia del predicado)
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