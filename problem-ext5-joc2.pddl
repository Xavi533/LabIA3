(define (problem ricorico-ext5-joc2)
  (:domain ricorico-ext5)

  (:objects
    crema-calabaza lentejas-estofadas arroz-tres-delicias tortilla-patatas paella
    gazpacho-andaluz ensalada-legumbres risotto-setas huevos-rellenos            - primero

    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana
    lubina-plancha estofado-ternera croquetas-jamon sardinas-espeto             - segundo

    lunes martes miercoles jueves viernes                                        - dia

    arroz crema legumbre huevo                                                   - tipo-plato
    pescado carne frito                                                          - tipo-plato
  )

  (:init
    (dia-sin-menu lunes) (dia-sin-menu martes) (dia-sin-menu miercoles)
    (dia-sin-menu jueves) (dia-sin-menu viernes)

    (primer-dia lunes)
    (siguiente-dia lunes martes) (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves) (siguiente-dia jueves viernes)

    (incompatible paella albondigas-salsa)
    (incompatible lentejas-estofadas calamar-romana)
    (incompatible crema-calabaza cordero-asado)

    ;; ─────────── Tipos de platos ───────────
    (es-tipo-primero paella arroz)
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero tortilla-patatas huevo)
    (es-tipo-primero gazpacho-andaluz crema)
    (es-tipo-primero ensalada-legumbres legumbre)
    (es-tipo-primero risotto-setas arroz)
    (es-tipo-primero huevos-rellenos huevo)

    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)
    (es-tipo-segundo lubina-plancha pescado)
    (es-tipo-segundo estofado-ternera carne)
    (es-tipo-segundo croquetas-jamon frito)
    (es-tipo-segundo sardinas-espeto pescado)

    ;; ─────────── Calorías ───────────
    ;; Primeros
    (= (calorias-primero paella)             650)
    (= (calorias-primero crema-calabaza)     400)
    (= (calorias-primero lentejas-estofadas) 500)
    (= (calorias-primero arroz-tres-delicias)600)
    (= (calorias-primero tortilla-patatas)   450)
    (= (calorias-primero gazpacho-andaluz)   300)
    (= (calorias-primero ensalada-legumbres) 350)
    (= (calorias-primero risotto-setas)      650)
    (= (calorias-primero huevos-rellenos)    500)

    ;; Segundos
    (= (calorias-segundo bacalao-horno)      550)
    (= (calorias-segundo albondigas-salsa)   700)
    (= (calorias-segundo pechuga-plancha)    600)
    (= (calorias-segundo cordero-asado)      850)
    (= (calorias-segundo calamar-romana)     650)
    (= (calorias-segundo lubina-plancha)     600)
    (= (calorias-segundo estofado-ternera)   750)
    (= (calorias-segundo croquetas-jamon)    700)
    (= (calorias-segundo sardinas-espeto)    650)

    ;; ─────────── Precios ───────────
    ;; Primeros
    (= (precio-primero paella)              10)
    (= (precio-primero crema-calabaza)     2.5)
    (= (precio-primero lentejas-estofadas)   3)
    (= (precio-primero arroz-tres-delicias)  6)
    (= (precio-primero tortilla-patatas)     4)
    (= (precio-primero gazpacho-andaluz)   3.5)
    (= (precio-primero ensalada-legumbres)   4)
    (= (precio-primero risotto-setas)        7)
    (= (precio-primero huevos-rellenos)    4.5)

    ;; Segundos
    (= (precio-segundo bacalao-horno)        11)
    (= (precio-segundo albondigas-salsa)      5)
    (= (precio-segundo pechuga-plancha)     6.5)
    (= (precio-segundo cordero-asado)        15)
    (= (precio-segundo calamar-romana)        8)
    (= (precio-segundo lubina-plancha)       11)
    (= (precio-segundo estofado-ternera)     10)
    (= (precio-segundo croquetas-jamon)       8)
    (= (precio-segundo sardinas-espeto)       9)

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
