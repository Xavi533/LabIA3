(define (problem ricorico-ext3-joc1)
  (:domain ricorico-ext3)
  
  (:objects
    ; Platos primeros
    paella sopa-verduras ensalada-mixta macarrones gazpacho - primero
    
    ; Platos segundos
    salmon-plancha fabada-asturiana pollo-asado filete-ternera merluza-salsa - segundo
    
    ; Tipos de plato
    arroz sopa ensalada pasta - tipo-plato
    pescado legumbre carne - tipo-plato
  )
  
  (:init
    ; Días necesitan menú
    (dia-sin-menu-lunes)
    (dia-sin-menu-martes)
    (dia-sin-menu-miercoles)
    (dia-sin-menu-jueves)
    (dia-sin-menu-viernes)
    
    ; Incompatibilidades
    (incompatible paella fabada-asturiana)
    (incompatible macarrones fabada-asturiana)
    (incompatible sopa-verduras salmon-plancha)
    (incompatible sopa-verduras merluza-salsa)
    (incompatible gazpacho fabada-asturiana)
    (incompatible gazpacho filete-ternera)
    
    ; Tipos de primeros platos
    (es-tipo-primero paella arroz)
    (es-tipo-primero sopa-verduras sopa)
    (es-tipo-primero ensalada-mixta ensalada)
    (es-tipo-primero macarrones pasta)
    (es-tipo-primero gazpacho sopa)
    
    ; Tipos de segundos platos
    (es-tipo-segundo salmon-plancha pescado)
    (es-tipo-segundo fabada-asturiana legumbre)
    (es-tipo-segundo pollo-asado carne)
    (es-tipo-segundo filete-ternera carne)
    (es-tipo-segundo merluza-salsa pescado)
    
    ; NOTA: La obligación de paella los jueves está hardcoded en el dominio
    ; mediante la acción asignar-paella-jueves
  )

  (:goal 
    (and
      ; Todos los días deben tener menú asignado
      (dia-asignado-lunes)
      (dia-asignado-martes)
      (dia-asignado-miercoles)
      (dia-asignado-jueves)
      (dia-asignado-viernes)
    )
  )
)