(define (problem ricorico-ext4-joc2)
  (:domain ricorico-ext4)
  
  (:objects
    ; Platos primeros
    paella crema-calabaza lentejas-estofadas arroz-tres-delicias tortilla-patatas - primero
    
    ; Platos segundos
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana - segundo
    
    ; Tipos de plato
    arroz crema legumbre huevo - tipo-plato
    pescado carne frito - tipo-plato
  )
  
  (:init
    ; Días necesitan menú
    (dia-sin-menu-lunes)
    (dia-sin-menu-martes)
    (dia-sin-menu-miercoles)
    (dia-sin-menu-jueves)
    (dia-sin-menu-viernes)
    
    ; Incompatibilidades reducidas para facilitar solución con calorías
    (incompatible paella albondigas-salsa)
    (incompatible lentejas-estofadas calamar-romana)
    (incompatible crema-calabaza cordero-asado)
    
    ; Tipos de primeros platos
    (es-tipo-primero paella arroz)
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero tortilla-patatas huevo)
    
    ; Tipos de segundos platos
    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)
    
    ; NUEVO: Calorías diferentes para variar las combinaciones
    ; Primeros (valores distintos al joc1)
    (= (calorias-primero paella) 650)
    (= (calorias-primero crema-calabaza) 400)
    (= (calorias-primero lentejas-estofadas) 500)
    (= (calorias-primero arroz-tres-delicias) 600)
    (= (calorias-primero tortilla-patatas) 450)
    
    ; Segundos (ajustados para cumplir 1000-1500)
    (= (calorias-segundo bacalao-horno) 550)
    (= (calorias-segundo albondigas-salsa) 700)
    (= (calorias-segundo pechuga-plancha) 600)
    (= (calorias-segundo cordero-asado) 850)
    (= (calorias-segundo calamar-romana) 650)
    
    ; Inicializar contadores
    (= (calorias-dia-lunes) 0)
    (= (calorias-dia-martes) 0)
    (= (calorias-dia-miercoles) 0)
    (= (calorias-dia-jueves) 0)
    (= (calorias-dia-viernes) 0)
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