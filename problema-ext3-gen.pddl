(define (problem ricorico-ext3-generado)
  (:domain ricorico-ext3)

  (:objects
    primero1 primero2 primero3 primero4 primero5 primero6 - primero
    segundo1 segundo2 segundo3 segundo4 segundo5 segundo6 - segundo
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
    (es-tipo-primero primero2 tipo1)
    (es-tipo-primero primero3 tipo3)
    (es-tipo-primero primero4 tipo4)
    (es-tipo-primero primero5 tipo1)
    (es-tipo-primero primero6 tipo2)

    (es-tipo-segundo segundo1 tipo2)
    (es-tipo-segundo segundo2 tipo1)
    (es-tipo-segundo segundo3 tipo1)
    (es-tipo-segundo segundo4 tipo2)
    (es-tipo-segundo segundo5 tipo1)
    (es-tipo-segundo segundo6 tipo3)

    (primero-en-dia jueves primero1)
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