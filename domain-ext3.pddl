(define (domain redflix-ext3)
  (:requirements :strips :typing :fluents :negative-preconditions :universal-preconditions :existential-preconditions :equality)

  (:types contingut dia)

  (:predicates
    (predecessor?p - contingut?c - contingut)
    (paralel?c1 - contingut?c2 - contingut)
    (vist?c - contingut) ; Significa que el contenido está completamente resuelto y visto
    (pendent?c - contingut) ; Sigue siendo el objetivo principal a eliminar
    (originalmente-pendent?c - contingut)
    (planificat?c - contingut?d - dia) ;?c está programado para el día?d
    (dia-anterior?d1 - dia?d2 - dia) ;?d1 es el día inmediatamente anterior a?d2
  )

  (:functions
    (items-en-dia?d - dia) - number ; Número de items planificados en el día?d
    (dia-num?d - dia) - number ; Número identificador del día (para restricciones de paralelos)
    (ultim-dia-vist-num?c - contingut) - number ; El dia-num en que?c fue planificado
  )

  (:action vist_global
    :parameters (?c - contingut?d - dia)
    :precondition (and
      (not (vist?c)) ; Aún no está resuelto completamente
      (not (planificat?c?d)) ; No planificar dos veces en el mismo día (o en general si ya está en un día)
                               ; Podríamos necesitar (not (exists (?other-d - dia) (planificat?c?other-d))) si solo se planifica una vez.
                               ; Por ahora, permitimos replanificar si es necesario, aunque el planificador buscará la eficiencia.
      (< (items-en-dia?d) 3)

      ; Predecesores deben estar VISTOS y en un DÍA ANTERIOR
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
      ; Si un paralelo YA ESTÁ VISTO (y por tanto planificado), debe cumplir la ventana temporal
      (forall (?par - contingut)
        (imply (and (paralel?c?par) (vist?par))
               (exists (?pard - dia)
                  (and (planificat?par?pard)
                       (or (= (dia-num?pard) (dia-num?d))
                           (and (dia-anterior?pard?d) (= (+ (dia-num?pard) 1) (dia-num?d))) ;?pard es?d-1
                           (and (dia-anterior?d?pard) (= (+ (dia-num?d) 1) (dia-num?pard))) ;?pard es?d+1
                       )
                  )
               )
        )
      )
    )
    :effect (and
      (planificat?c?d)
      (increase (items-en-dia?d) 1)
      (assign (ultim-dia-vist-num?c) (dia-num?d))
      ; No se marca como (vist?c) ni (not (pendent?c)) aquí. Eso lo hacen marcar_vist/totsparalelvists.
    )
  )

  (:action marcar_vist ; Para contenidos sin paralelos o cuyos paralelos ya están resueltos
    :parameters (?c - contingut)
    :precondition (and
      (pendent?c)
      (not (vist?c))
      (exists (?d - dia) (planificat?c?d)) ; Debe estar planificado en algún día
      (not (exists (?par_any - contingut) (paralel?c?par_any))) ; No tiene paralelos
    )
    :effect (and
      (vist?c)
      (not (pendent?c))
    )
  )

  (:action totsparalelvists ; Para contenidos con paralelos, una vez todos sus paralelos están VISTOS
    :parameters (?c - contingut)
    :precondition (and
      (pendent?c)
      (not (vist?c))
      (exists (?d - dia) (planificat?c?d)) ; Debe estar planificado
      (exists (?par_any - contingut) (paralel?c?par_any)) ; Debe tener paralelos
      (forall (?par - contingut) ; Todos sus paralelos deben estar VISTOS (y por tanto correctamente planificados)
        (imply (paralel?c?par) (vist?par))
      )
    )
    :effect (and
      (vist?c)
      (not (pendent?c))
    )
  )
)