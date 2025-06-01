(define (domain redflix-ext4)
  (:requirements :strips :typing :fluents :negative-preconditions :universal-preconditions :existential-preconditions :equality)

  (:types contingut dia)

  (:predicates
    (predecessor?p - contingut?c - contingut)
    (paralel?c1 - contingut?c2 - contingut)
    (vist?c - contingut)
    (pendent?c - contingut)
    (originalmente-pendent?c - contingut)
    (planificat?c - contingut?d - dia)
    (dia-anterior?d1 - dia?d2 - dia)
  )

  (:functions
    (minuts-en-dia?d - dia) - number ; Minutos acumulados en el día?d
    (durada?c - contingut) - number ; Duración del contenido?c en minutos
    (dia-num?d - dia) - number
    (ultim-dia-vist-num?c - contingut) - number
  )

  (:action vist_global
    :parameters (?c - contingut?d - dia)
    :precondition (and
      (not (vist?c))
      (not (exists (?otherd - dia) (planificat?c?otherd))) ; Planificar cada contenido solo una vez
      (<= (+ (minuts-en-dia?d) (durada?c)) 200)

      (forall (?p - contingut)
        (imply (predecessor?p?c)
               (and (vist?p)
                    (exists (?pd - dia)
                      (and (planificat?p?pd)
                           (dia-anterior?pd?d)
                      )
                    )
               )
        )
      )
      (forall (?par - contingut)
        (imply (and (paralel?c?par) (vist?par))
               (exists (?pard - dia)
                  (and (planificat?par?pard)
                       (or (= (dia-num?pard) (dia-num?d))
                           (and (dia-anterior?pard?d) (= (+ (dia-num?pard) 1) (dia-num?d)))
                           (and (dia-anterior?d?pard) (= (+ (dia-num?d) 1) (dia-num?pard)))
                       )
                  )
               )
        )
      )
    )
    :effect (and
      (planificat?c?d)
      (increase (minuts-en-dia?d) (durada?c))
      (assign (ultim-dia-vist-num?c) (dia-num?d))
    )
  )

  (:action marcar_vist
    :parameters (?c - contingut)
    :precondition (and
      (pendent?c)
      (not (vist?c))
      (exists (?d - dia) (planificat?c?d))
      (not (exists (?par_any - contingut) (paralel?c?par_any)))
    )
    :effect (and
      (vist?c)
      (not (pendent?c))
    )
  )

  (:action totsparalelvists
    :parameters (?c - contingut)
    :precondition (and
      (pendent?c)
      (not (vist?c))
      (exists (?d - dia) (planificat?c?d))
      (exists (?par_any - contingut) (paralel?c?par_any))
      (forall (?par - contingut)
        (imply (paralel?c?par) (vist?par))
      )
    )
    :effect (and
      (vist?c)
      (not (pendent?c))
    )
  )
)