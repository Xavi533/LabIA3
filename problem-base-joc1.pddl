(define (problem ricorico-base-joc1)
  (:domain ricorico-base)
  (:objects
    A C - first
    B D - second
    Lunes Martes Miercoles Jueves Viernes Sabado Domingo - day
  )
  (:init
    (incompatible A D)
    (incompatible C B)
  )

  (:goal (forall (?d - day)
            (exists (?f - first ?s - second) (asigned ?d ?f ?s))
            )
  )
)