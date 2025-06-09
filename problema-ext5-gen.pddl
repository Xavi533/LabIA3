(define (problem ricorico-ext5-generado)
  (:domain ricorico-ext5)

  (:objects
    primero1 primero2 primero3 primero4 primero5 primero6 primero7 primero8 - primero
    segundo1 segundo2 segundo3 segundo4 segundo5 segundo6 segundo7 segundo8 - segundo
    lunes martes miercoles jueves viernes - dia
    tipo1 tipo2 tipo3 tipo4 tipo5 - tipo-plato
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

    (es-tipo-primero primero1 tipo4)
    (es-tipo-primero primero2 tipo2)
    (es-tipo-primero primero3 tipo1)
    (es-tipo-primero primero4 tipo1)
    (es-tipo-primero primero5 tipo4)
    (es-tipo-primero primero6 tipo1)
    (es-tipo-primero primero7 tipo2)
    (es-tipo-primero primero8 tipo3)

    (es-tipo-segundo segundo1 tipo3)
    (es-tipo-segundo segundo2 tipo2)
    (es-tipo-segundo segundo3 tipo5)
    (es-tipo-segundo segundo4 tipo3)
    (es-tipo-segundo segundo5 tipo1)
    (es-tipo-segundo segundo6 tipo2)
    (es-tipo-segundo segundo7 tipo5)
    (es-tipo-segundo segundo8 tipo2)

    (= (calorias-primero primero1) 455)
    (= (calorias-primero primero2) 497)
    (= (calorias-primero primero3) 314)
    (= (calorias-primero primero4) 606)
    (= (calorias-primero primero5) 454)
    (= (calorias-primero primero6) 681)
    (= (calorias-primero primero7) 346)
    (= (calorias-primero primero8) 422)

    (= (calorias-segundo segundo1) 413)
    (= (calorias-segundo segundo2) 782)
    (= (calorias-segundo segundo3) 424)
    (= (calorias-segundo segundo4) 404)
    (= (calorias-segundo segundo5) 787)
    (= (calorias-segundo segundo6) 504)
    (= (calorias-segundo segundo7) 525)
    (= (calorias-segundo segundo8) 404)

    (= (precio-primero primero1) 3.8)
    (= (precio-primero primero2) 4.3)
    (= (precio-primero primero3) 4.8)
    (= (precio-primero primero4) 5.2)
    (= (precio-primero primero5) 9.3)
    (= (precio-primero primero6) 3.8)
    (= (precio-primero primero7) 9.0)
    (= (precio-primero primero8) 4.3)

    (= (precio-segundo segundo1) 11.7)
    (= (precio-segundo segundo2) 6.1)
    (= (precio-segundo segundo3) 13.6)
    (= (precio-segundo segundo4) 9.4)
    (= (precio-segundo segundo5) 6.2)
    (= (precio-segundo segundo6) 10.0)
    (= (precio-segundo segundo7) 6.2)
    (= (precio-segundo segundo8) 7.2)

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