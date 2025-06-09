(define (problem ricorico-ext1-joc2)
  (:domain ricorico-ext1)
  
  (:objects
    ; Exactamente 5 primeros y 5 segundos para forzar uso único
    paella sopa-verduras ensalada-mixta macarrones gazpacho crema-calabaza lentejas-estofadas arroz-tres-delicias fideos-marinera tortilla-patatas - primero
    salmon-plancha fabada-asturiana pollo-asado filete-ternera merluza-salsa bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
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
    
    (incompatible paella salmon-plancha)
    (incompatible paella fabada-asturiana)
    (incompatible paella pollo-asado)
    (incompatible paella filete-ternera)
    (incompatible paella merluza-salsa)

    (incompatible sopa-verduras salmon-plancha)
    (incompatible sopa-verduras fabada-asturiana)
    (incompatible sopa-verduras pollo-asado)
    (incompatible sopa-verduras filete-ternera)
    (incompatible sopa-verduras merluza-salsa)

    (incompatible ensalada-mixta salmon-plancha)
    (incompatible ensalada-mixta fabada-asturiana)
    (incompatible ensalada-mixta pollo-asado)
    (incompatible ensalada-mixta filete-ternera)
    (incompatible ensalada-mixta merluza-salsa)

    (incompatible macarrones salmon-plancha)
    (incompatible macarrones fabada-asturiana)
    (incompatible macarrones pollo-asado)
    (incompatible macarrones filete-ternera)
    (incompatible macarrones merluza-salsa)

    (incompatible gazpacho salmon-plancha)
    (incompatible gazpacho fabada-asturiana)
    (incompatible gazpacho pollo-asado)
    (incompatible gazpacho filete-ternera)
    (incompatible gazpacho merluza-salsa)
    
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