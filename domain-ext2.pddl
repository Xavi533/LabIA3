(define (domain redflix-ext2)
  (:requirements :strips :typing :negative-preconditions :universal-preconditions :existential-preconditions)

  (:types contingut)

  (:predicates
    (predecessor?p - contingut?c - contingut)
    (paralel?c1 - contingut?c2 - contingut)
    (vist?c - contingut)
    (pendent?c - contingut)
    (originalmente-pendent?c - contingut)
  )

  ; Acción para visualizar contenido que no tiene paralelos o cuyos paralelos ya están vistos
  (:action visualitzar-individual
    :parameters (?c - contingut)
    :precondition (and
      (pendent?c)
      (not (vist?c))
      (forall (?p - contingut) ; Todos los predecesores de?c deben estar vistos
        (imply (predecessor?p?c) (vist?p))
      )
      (forall (?par - contingut) ; Todos los paralelos de?c deben estar vistos
        (imply (paralel?c?par) (vist?par))
      )
    )
    :effect (and
      (vist?c)
      (not (pendent?c))
    )
  )

  ; Acción para marcar dos contenidos paralelos como vistos simultáneamente
  ; Asume que la restricción de día (+/-1) no se modela explícitamente aquí, sino en extensiones posteriores.
  ; Esta acción se enfoca en la lógica de verlos.
  (:action mirar_avui-dema 
    :parameters (?c1 - contingut?c2 - contingut)
    :precondition (and
      (paralel?c1?c2)
      (paralel?c2?c1) ; Asegurar simetría si no está implícita
      (not (vist?c1))
      (not (vist?c2))
      (forall (?p - contingut) (imply (predecessor?p?c1) (vist?p)))
      (forall (?p - contingut) (imply (predecessor?p?c2) (vist?p)))
    )
    :effect (and
      (vist?c1)
      (vist?c2)
      ; Si eran originalmente pendientes, ya no lo son.
      ; Otros ítems pendientes se resuelven con totsparalelvists o visualitzar-individual
    )
  )

  ; Acción para marcar un contenido como resuelto una vez todos sus paralelos han sido vistos.
  (:action totsparalelvists
    :parameters (?c - contingut)
    :precondition (and
      (pendent?c)
      (not (vist?c))
      (exists (?par_any - contingut) (paralel?c?par_any)) ;?c debe tener/haber tenido paralelos
      (forall (?p - contingut) (imply (predecessor?p?c) (vist?p)))
      (forall (?par - contingut) (imply (paralel?c?par) (vist?par)))
    )
    :effect (and
      (vist?c)
      (not (pendent?c))
    )
  )
)