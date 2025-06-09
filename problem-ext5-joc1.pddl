(define (problem ricorico-ext5-joc1)
  (:domain ricorico-ext5)

  (:objects
    sopa-verduras ensalada-mixta macarrones gazpacho paella
    crema-calabaza ensalada-cesar lasagna-verduras arroz-negro     - primero

    salmon-plancha fabada-asturiana pollo-asado filete-ternera merluza-salsa
    atun-plancha costillas-cerdo lentejas-estofadas bacalao-horno  - segundo

    lunes martes miercoles jueves viernes                          - dia

    arroz sopa ensalada pasta pescado legumbre carne               - tipo-plato
  )

  (:init

    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)

    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)

    (incompatible paella fabada-asturiana)
    (incompatible sopa-verduras salmon-plancha)
    (incompatible gazpacho fabada-asturiana)

    (es-tipo-primero paella arroz)
    (es-tipo-primero sopa-verduras sopa)
    (es-tipo-primero ensalada-mixta ensalada)
    (es-tipo-primero macarrones pasta)
    (es-tipo-primero gazpacho sopa)
  
    (es-tipo-primero crema-calabaza sopa)
    (es-tipo-primero ensalada-cesar ensalada)
    (es-tipo-primero lasagna-verduras pasta)
    (es-tipo-primero arroz-negro arroz)

    (es-tipo-segundo salmon-plancha pescado)
    (es-tipo-segundo fabada-asturiana legumbre)
    (es-tipo-segundo pollo-asado carne)
    (es-tipo-segundo filete-ternera carne)
    (es-tipo-segundo merluza-salsa pescado)

    (es-tipo-segundo atun-plancha pescado)
    (es-tipo-segundo costillas-cerdo carne)
    (es-tipo-segundo lentejas-estofadas legumbre)
    (es-tipo-segundo bacalao-horno pescado)

    ;; ---------- Calorías ----------
    ; Primeros
    (= (calorias-primero paella)             600)
    (= (calorias-primero sopa-verduras)      350)
    (= (calorias-primero ensalada-mixta)     300)
    (= (calorias-primero macarrones)         550)
    (= (calorias-primero gazpacho)           250)
    (= (calorias-primero crema-calabaza)     300)
    (= (calorias-primero ensalada-cesar)     350)
    (= (calorias-primero lasagna-verduras)   600)
    (= (calorias-primero arroz-negro)        650)

    ; Segundos
    (= (calorias-segundo salmon-plancha)     700)
    (= (calorias-segundo fabada-asturiana)   750)
    (= (calorias-segundo pollo-asado)        650)
    (= (calorias-segundo filete-ternera)     800)
    (= (calorias-segundo merluza-salsa)      600)
    (= (calorias-segundo atun-plancha)       650)
    (= (calorias-segundo costillas-cerdo)    800)
    (= (calorias-segundo lentejas-estofadas) 700)
    (= (calorias-segundo bacalao-horno)      680)

    ;; ---------- Precios ----------
    ; Primeros
    (= (precio-primero paella)            8)
    (= (precio-primero sopa-verduras)     3)
    (= (precio-primero ensalada-mixta)    4)
    (= (precio-primero macarrones)        5)
    (= (precio-primero gazpacho)          3.5)
    (= (precio-primero crema-calabaza)    3.5)
    (= (precio-primero ensalada-cesar)    4.5)
    (= (precio-primero lasagna-verduras)  6)
    (= (precio-primero arroz-negro)       7)

    ; Segundos
    (= (precio-segundo salmon-plancha)      12)
    (= (precio-segundo fabada-asturiana)     6)
    (= (precio-segundo pollo-asado)          7)
    (= (precio-segundo filete-ternera)      10)
    (= (precio-segundo merluza-salsa)        9)
    (= (precio-segundo atun-plancha)        11)
    (= (precio-segundo costillas-cerdo)     10)
    (= (precio-segundo lentejas-estofadas)   8)
    (= (precio-segundo bacalao-horno)       12)

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

  ;; Puedes seguir usando maximize o cambiar a minimize según tu experimento
  (:metric minimize (total-cost))
)
