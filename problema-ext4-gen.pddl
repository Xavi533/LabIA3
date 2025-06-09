(define (problem ricorico-ext4-generado)
  (:domain ricorico-ext4)

  (:objects
    primero1 primero2 primero3 primero4 primero5 primero6 primero7 - primero
    segundo1 segundo2 segundo3 segundo4 segundo5 segundo6 segundo7 - segundo
    lunes martes miercoles jueves viernes - dia
    tipo1 tipo2 tipo3 tipo4 - tipo-plato
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

    (es-tipo-primero primero1 tipo2)
    (es-tipo-primero primero2 tipo4)
    (es-tipo-primero primero3 tipo1)
    (es-tipo-primero primero4 tipo1)
    (es-tipo-primero primero5 tipo4)
    (es-tipo-primero primero6 tipo1)
    (es-tipo-primero primero7 tipo4)

    (es-tipo-segundo segundo1 tipo1)
    (es-tipo-segundo segundo2 tipo4)
    (es-tipo-segundo segundo3 tipo3)
    (es-tipo-segundo segundo4 tipo1)
    (es-tipo-segundo segundo5 tipo4)
    (es-tipo-segundo segundo6 tipo3)
    (es-tipo-segundo segundo7 tipo2)

    (= (calorias-primero primero1) 431)
    (= (calorias-primero primero2) 656)
    (= (calorias-primero primero3) 510)
    (= (calorias-primero primero4) 513)
    (= (calorias-primero primero5) 328)
    (= (calorias-primero primero6) 413)
    (= (calorias-primero primero7) 360)

    (= (calorias-segundo segundo1) 660)
    (= (calorias-segundo segundo2) 796)
    (= (calorias-segundo segundo3) 510)
    (= (calorias-segundo segundo4) 575)
    (= (calorias-segundo segundo5) 511)
    (= (calorias-segundo segundo6) 497)
    (= (calorias-segundo segundo7) 733)
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