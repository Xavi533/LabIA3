(define (problem ricorico-ext5-joc2)
  (:domain ricorico-ext5)
  
  (:objects
    ; Platos primeros
    crema-calabaza lentejas-estofadas arroz-tres-delicias tortilla-patatas - primero
    
    ; Platos segundos
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
    ; Días
    lunes martes miercoles viernes - dia
    
    ; Tipos de plato
    arroz crema legumbre huevo - tipo-plato
    pescado carne frito - tipo-plato
  )
  
  (:init
    ; Días necesitan menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)
    
    ; Definir orden de días
    (primero-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)
    
    ; Incompatibilidades
    (incompatible paella albondigas-salsa)
    (incompatible lentejas-estofadas calamar-romana)
    (incompatible crema-calabaza cordero-asado)
    
    ; Tipos de platos
    (es-tipo-primero paella arroz)
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero tortilla-patatas huevo)
    
    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)
    
    ; Calorías
    (= (calorias-primero paella) 650)
    (= (calorias-primero crema-calabaza) 400)
    (= (calorias-primero lentejas-estofadas) 500)
    (= (calorias-primero arroz-tres-delicias) 600)
    (= (calorias-primero tortilla-patatas) 450)
    
    (= (calorias-segundo bacalao-horno) 550)
    (= (calorias-segundo albondigas-salsa) 700)
    (= (calorias-segundo pechuga-plancha) 600)
    (= (calorias-segundo cordero-asado) 850)
    (= (calorias-segundo calamar-romana) 650)
    
    ; Precios
    (= (precio-primero paella) 10)
    (= (precio-primero crema-calabaza) 2.5)
    (= (precio-primero lentejas-estofadas) 3)
    (= (precio-primero arroz-tres-delicias) 6)
    (= (precio-primero tortilla-patatas) 4)
    
    (= (precio-segundo bacalao-horno) 11)
    (= (precio-segundo albondigas-salsa) 5)
    (= (precio-segundo pechuga-plancha) 6.5)
    (= (precio-segundo cordero-asado) 15)
    (= (precio-segundo calamar-romana) 8)
    
    ; Inicializar contadores
    (= (calorias-dia lunes) 0)
    (= (calorias-dia martes) 0)
    (= (calorias-dia miercoles) 0)
    (= (calorias-dia jueves) 0)
    (= (calorias-dia viernes) 0)
    (= (total-cost) 0)
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
  
  (:metric minimize (total-cost))
)