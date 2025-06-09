(define (problem ricorico-base-generado)
  (:domain ricorico-base)

  (:objects
    primero1 primero2 primero3 primero4 primero5 - primero
    segundo1 segundo2 segundo3 segundo4 segundo5 - segundo
    lunes martes miercoles jueves viernes - dia
  )

  (:init
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)

    (incompatible primero1 segundo3)
    (incompatible primero3 segundo2)
    (incompatible primero2 segundo1)
    (incompatible primero4 segundo5)
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