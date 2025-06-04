(define (problem ricorico-base-joc1)
  (:domain ricorico-base)
  (:objects
    f1 f2 f3 f4 f5 f6 f7 - first
    s1 s2 s3 s4 s5 s6 s7 - second
    Lunes Martes Miercoles Jueves Viernes Sabado Domingo - day
  )
  (:init
    (incompatible f1 s1)
    (incompatible f2 s2)
  )

  (:goal (forall (?d - day)
            (exists (?f - first ?s - second) (asigned ?d ?f ?s))
            )
  )
)