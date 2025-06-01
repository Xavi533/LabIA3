(define (problem redflix-base-joc1)
  (:domain redflix-base)
  (:objects
    serie1 episodi1 episodi2 episodi3 episodi4 pellicula1 pellicula2 curt1 curt2 - contingut
  )
  (:init
    (predecessor serie1 episodi1)
    (predecessor episodi1 episodi2)
    (predecessor episodi2 episodi3)
    (predecessor episodi3 episodi4)
    (predecessor pellicula1 pellicula2)
    (predecessor curt1 curt2)

    (pendent episodi4)
    (originalmente-pendent episodi4)
    (pendent pellicula2)
    (originalmente-pendent pellicula2)
    (pendent curt2)
    (originalmente-pendent curt2)
    
    ; Contenidos que no son inicialmente pendientes pero deben ser vistos si son predecesores
    (pendent serie1)
    (pendent episodi1)
    (pendent episodi2)
    (pendent episodi3)
    (pendent pellicula1)
    (pendent curt1)
  )
  (:goal (forall (?c - contingut)
             (imply (originalmente-pendent?c) (vist?c)))
  )
)