(define (problem redflix-ext4-joc1)
  (:domain redflix-ext4)
  (:objects
    episodi1 episodi2 episodi3 episodi4 episodi5 pellicula1 pellicula2 
    curt1 curt2 curt3 curt4 documental1 documental2 - contingut
    dia1 dia2 dia3 dia4 dia5 dia6 - dia
  )
  (:init
    (predecessor episodi1 episodi2) (predecessor episodi2 episodi3) (predecessor episodi3 episodi4) (predecessor episodi4 episodi5)
    (predecessor pellicula1 curt1)
    (predecessor curt2 curt3) (predecessor curt3 documental1)
    (predecessor curt4 documental2)

    (paralel curt1 curt2) (paralel curt2 curt1)
    (paralel curt3 curt4) (paralel curt4 curt3)

    (= (durada episodi1) 40) (= (durada episodi2) 50) (= (durada episodi3) 50) (= (durada episodi4) 60) (= (durada episodi5) 30)
    (= (durada pellicula1) 90) (= (durada pellicula2) 100)
    (= (durada curt1) 20) (= (durada curt2) 30) (= (durada curt3) 40) (= (durada curt4) 35)
    (= (durada documental1) 60) (= (durada documental2) 70)

    (pendent episodi1) (originalmente-pendent episodi1)
    (pendent episodi2) (originalmente-pendent episodi2)
    (pendent episodi3) (originalmente-pendent episodi3)
    (pendent episodi4) (originalmente-pendent episodi4)
    (pendent episodi5) (originalmente-pendent episodi5)
    (pendent pellicula1) (originalmente-pendent pellicula1)
    (pendent pellicula2) (originalmente-pendent pellicula2)
    (pendent curt1) (originalmente-pendent curt1)
    (pendent curt2) (originalmente-pendent curt2)
    (pendent curt3) (originalmente-pendent curt3)
    (pendent curt4) (originalmente-pendent curt4)
    (pendent documental1) (originalmente-pendent documental1)
    (pendent documental2) (originalmente-pendent documental2)

    (= (minuts-en-dia dia1) 0) (= (minuts-en-dia dia2) 0) (= (minuts-en-dia dia3) 0)
    (= (minuts-en-dia dia4) 0) (= (minuts-en-dia dia5) 0) (= (minuts-en-dia dia6) 0)

    (= (dia-num dia1) 1) (= (dia-num dia2) 2) (= (dia-num dia3) 3)
    (= (dia-num dia4) 4) (= (dia-num dia5) 5) (= (dia-num dia6) 6)

    (dia-anterior dia1 dia2) (dia-anterior dia2 dia3) (dia-anterior dia3 dia4)
    (dia-anterior dia4 dia5) (dia-anterior dia5 dia6)
  )
  (:goal (forall (?c - contingut)
             (imply (originalmente-pendent?c) (vist?c)))
  )
)