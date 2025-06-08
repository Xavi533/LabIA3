(define (problem ricorico-ext4-joc1)
  (:domain ricorico-ext4)
  
  (:objects
    ; Platos primeros
    sopa-verduras ensalada-mixta macarrones gazpacho paella - primero
    
    ; Platos segundos
    salmon-plancha fabada-asturiana pollo-asado filete-ternera merluza-salsa - segundo
    
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
    
    ; Definir orden de días
    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Incompatibilidades (reducidas)
    (incompatible paella fabada-asturiana)
    (incompatible sopa-verduras salmon-plancha)
    (incompatible gazpacho fabada-asturiana)
    
    ; Tipos de platos
    (es-tipo-primero paella arroz)
    (es-tipo-primero sopa-verduras sopa)
    (es-tipo-primero ensalada-mixta ensalada)
    (es-tipo-primero macarrones pasta)
    (es-tipo-primero gazpacho sopa)
    
    (es-tipo-segundo salmon-plancha pescado)
    (es-tipo-segundo fabada-asturiana legumbre)
    (es-tipo-segundo pollo-asado carne)
    (es-tipo-segundo filete-ternera carne)
    (es-tipo-segundo merluza-salsa pescado)
    
    ; Calorías de cada plato
    (= (calorias-primero paella) 600)
    (= (calorias-primero sopa-verduras) 350)
    (= (calorias-primero ensalada-mixta) 300)
    (= (calorias-primero macarrones) 550)
    (= (calorias-primero gazpacho) 250)
    
    (= (calorias-segundo salmon-plancha) 700)
    (= (calorias-segundo fabada-asturiana) 750)
    (= (calorias-segundo pollo-asado) 650)
    (= (calorias-segundo filete-ternera) 800)
    (= (calorias-segundo merluza-salsa) 600)
    
    ; Inicializar contadores de calorías por día
    (= (calorias-dia lunes) 0)
    (= (calorias-dia martes) 0)
    (= (calorias-dia miercoles) 0)
    (= (calorias-dia jueves) 0)
    (= (calorias-dia viernes) 0)
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