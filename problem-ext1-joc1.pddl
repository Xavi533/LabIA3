(define (problem ricorico-ext1-joc1)
  (:domain ricorico-ext1)
  
  (:objects
    ; Necesitamos al menos 5 primeros y 5 segundos diferentes
    paella sopa-verduras ensalada-mixta macarrones gazpacho - primero
    salmon-plancha fabada-asturiana pollo-asado filete-ternera merluza-salsa - segundo
    
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