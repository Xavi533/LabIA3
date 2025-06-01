(define (problem redflix-ext1-joc1)
  (:domain redflix-ext1)
  (:objects
    episodi1 episodi2 episodi3 episodi4 serie1 pellicula1 curt1 curt2 documental1 documental2 - contingut
  )
  (:init
    (predecessor episodi1 episodi2)
    (predecessor episodi2 episodi3)
    (predecessor episodi3 episodi4)
    (predecessor serie1 episodi4)
    (predecessor pellicula1 curt1)
    (predecessor curt2 documental1)
    (predecessor documental2 curt1)
    (predecessor curt1 episodi3)

    (pendent episodi4)
    (originalmente-pendent episodi4)
    (pendent documental1)
    (originalmente-pendent documental1)

    ; Otros contenidos que deben ser marcados como pendientes para ser procesados
    (pendent episodi1)
    (pendent episodi2)
    (pendent episodi3)
    (pendent serie1)
    (pendent pellicula1)
    (pendent curt1)
    (pendent curt2)
    (pendent documental2)
  )
  (:goal (forall (?c - contingut)
             (imply (originalmente-pendent?c) (vist?c)))
  )
)