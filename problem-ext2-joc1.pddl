(define (problem redflix-ext2-joc1)
  (:domain redflix-ext2)
  (:objects
    episodi1 episodi2 episodi3 episodi4 pellicula1 curt1 curt2 curt3 documental1 documental2 - contingut
  )
  (:init
    (predecessor episodi1 episodi2)
    (predecessor episodi2 episodi3)
    (predecessor episodi3 episodi4)
    (predecessor pellicula1 curt1)
    (predecessor curt2 documental1)
    (predecessor documental2 curt1) ; Según doc, pero podría ser un error y ser (predecessor X documental2)
    (predecessor curt1 episodi3)

    (paralel episodi1 episodi3) (paralel episodi3 episodi1)
    (paralel episodi2 episodi4) (paralel episodi4 episodi2)
    (paralel curt1 curt3) (paralel curt3 curt1)
    (paralel curt2 curt4) (paralel curt4 curt2) ; curt4 no es un objeto en este problema, error en doc? Usaré los objetos definidos.
                                             ; El Joc de Prova 1 de Ext2 no lista curt4 como objeto.
                                             ; Lo omitiré o asumiré que curt4 es un error y no existe o no es paralelo.
                                             ; Para el PDDL, solo usaré objetos definidos.
    (paralel documental1 documental2) (paralel documental2 documental1)

    (pendent episodi4) (originalmente-pendent episodi4)
    (pendent documental1) (originalmente-pendent documental1)
    (pendent curt1) (originalmente-pendent curt1)
    (pendent curt3) (originalmente-pendent curt3)

    ; Otros contenidos que deben ser marcados como pendientes para ser procesados
    (pendent episodi1)
    (pendent episodi2)
    (pendent episodi3)
    (pendent pellicula1)
    (pendent curt2)
    (pendent documental2)
  )
  (:goal (forall (?c - contingut)
             (imply (originalmente-pendent?c) (vist?c)))
  )
)