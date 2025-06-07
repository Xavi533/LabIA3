(define (problem ricorico-ext5-joc1)
  (:domain ricorico-ext5)
  
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
    
    ; Incompatibilidades (reducidas para solubilidad)
    (incompatible paella fabada-asturiana)
    (incompatible sopa-verduras salmon-plancha)
    (incompatible gazpacho fabada-asturiana)
    
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
    
    ; Calorías de cada plato
    ; Primeros
    (= (calorias-primero paella) 600)
    (= (calorias-primero sopa-verduras) 350)
    (= (calorias-primero ensalada-mixta) 300)
    (= (calorias-primero macarrones) 550)
    (= (calorias-primero gazpacho) 250)
    
    ; Segundos
    (= (calorias-segundo salmon-plancha) 700)
    (= (calorias-segundo fabada-asturiana) 750)
    (= (calorias-segundo pollo-asado) 650)
    (= (calorias-segundo filete-ternera) 800)
    (= (calorias-segundo merluza-salsa) 600)
    
    ; NUEVO: Precios de cada plato (en euros)
    ; Primeros (precios variados para optimización)
    (= (precio-primero paella) 8)
    (= (precio-primero sopa-verduras) 3)
    (= (precio-primero ensalada-mixta) 4)
    (= (precio-primero macarrones) 5)
    (= (precio-primero gazpacho) 3.5)
    
    ; Segundos 
    (= (precio-segundo salmon-plancha) 12)
    (= (precio-segundo fabada-asturiana) 6)
    (= (precio-segundo pollo-asado) 7)
    (= (precio-segundo filete-ternera) 10)
    (= (precio-segundo merluza-salsa) 9)
    
    ; Inicializar contadores
    (= (calorias-dia-lunes) 0)
    (= (calorias-dia-martes) 0)
    (= (calorias-dia-miercoles) 0)
    (= (calorias-dia-jueves) 0)
    (= (calorias-dia-viernes) 0)
    (= (total-cost) 0)
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
  
  ; NUEVO: Métrica para minimizar el coste total
  (:metric minimize (total-cost))
)