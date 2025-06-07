(define (problem ricorico-base-joc1)
  (:domain ricorico-base)
  
  (:objects
    ; Platos primeros disponibles
    paella sopa-verduras ensalada-mixta macarrones gazpacho - primero
    
    ; Platos segundos disponibles  
    salmon-plancha fabada-asturiana pollo-asado filete-ternera merluza-salsa - segundo
    
    ; Días laborables de la semana
    lunes martes miercoles jueves viernes - dia
  )
  
  (:init
    ; Todos los días necesitan menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Incompatibilidades entre primeros y segundos
    ; Platos pesados no combinan bien
    (incompatible paella fabada-asturiana)
    (incompatible macarrones fabada-asturiana)
    
    ; Sopas y pescados no combinan bien
    (incompatible sopa-verduras salmon-plancha)
    (incompatible sopa-verduras merluza-salsa)
    
    ; Gazpacho no combina con platos calientes pesados
    (incompatible gazpacho fabada-asturiana)
    (incompatible gazpacho filete-ternera)
    
    ; Añadir más incompatibilidades para forzar variedad
    (incompatible ensalada-mixta fabada-asturiana)
    (incompatible paella filete-ternera)
    (incompatible paella pollo-asado)
    (incompatible macarrones salmon-plancha)
    (incompatible macarrones merluza-salsa)
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