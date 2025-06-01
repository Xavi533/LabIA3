(define (problem redflix-ext3-joc1)
  (:domain redflix-ext3)
  (:objects
    episodi1 episodi2 episodi3 episodi4 pellicula1 curt1 curt2 curt3 curt4 documental1 documental2 - contingut
    dia1 dia2 dia3 dia4 dia5 dia6 - dia
  )
  (:init
    (predecessor episodi1 episodi2)
    (predecessor episodi2 episodi3)
    (predecessor episodi3 episodi4)
    (predecessor pellicula1 curt1)
    (predecessor curt2 curt3)
    (predecessor curt3 documental1)
    (predecessor curt4 documental2)

    (paralel curt1 curt2) (paralel curt2 curt1)
    (paralel curt3 curt4) (paralel curt4 curt3)

    (pendent episodi1) (originalmente-pendent episodi1)
    (pendent episodi2) (originalmente-pendent episodi2)
    (pendent episodi3) (originalmente-pendent episodi3)
    (pendent episodi4) (originalmente-pendent episodi4)
    (pendent pellicula1) (originalmente-pendent pellicula1)
    (pendent curt1) (originalmente-pendent curt1)
    (pendent curt2) (originalmente-pendent curt2)
    (pendent curt3) (originalmente-pendent curt3)
    (pendent curt4) (originalmente-pendent curt4)
    (pendent documental1) (originalmente-pendent documental1)
    (pendent documental2) (originalmente-pendent documental2)

    (= (items-en-dia dia1) 0) (= (items-en-dia dia2) 0) (= (items-en-dia dia3) 0)
    (= (items-en-dia dia4) 0) (= (items-en-dia dia5) 0) (= (items-en-dia dia6) 0)

    (= (dia-num dia1) 1) (= (dia-num dia2) 2) (= (dia-num dia3) 3)
    (= (dia-num dia4) 4) (= (dia-num dia5) 5) (= (dia-num dia6) 6)

    (dia-anterior dia1 dia2) (dia-anterior dia2 dia3) (dia-anterior dia3 dia4)
    (dia-anterior dia4 dia5) (dia-anterior dia5 dia6)
  )
  (:goal (forall (?c - contingut)
             (imply (originalmente-pendent?c) (vist?c)))
  )
)