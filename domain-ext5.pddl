(define (domain ricorico-ext5)
  (:requirements :strips :typing :universal-preconditions :fluents)

  (:types first second day tipo)

  (:predicates
    (incompatible ?f - first ?s - second)
    (asigned ?d - day ?f - first ?s - second)
    (repetidoFirst ?f - first)
    (repetidoSecond ?s - second)
    (tipoFirst ?f - first ?t - tipo)
    (tipoSecond ?s - second ?t - tipo)
    (prevDay ?d1 - day ?d2 - day)
  )

  (:functions
  (caloriasFirst ?f - first)
  (caloriasSecond ?s - second)
  (precioFirst ?f - first)
  (precioSecond ?s - second)
  (precioTotal)
  )

  (:action asignar_menu
    :parameters 
    (?d - day 
    ?f - first 
    ?s - second 
    ?t1 - tipo 
    ?t2 - tipo 
    ?prevD - day 
    ?prevF - first 
    ?prevS - second )

    :precondition 
    (and
	 (not (asigned ?d ?f ?s))
     (not (incompatible ?f ?s))
     (not (repetidoFirst ?f))
     (not (repetidoSecond ?s))

     ;miramos los tipos del dia anterior
     (prevDay ?prevD ?d)
     (asigned ?prevD ?prevF ?prevS)
     (tipoFirst ?prevF ?t1)
     (tipoSecond ?prevS ?t2)

     ;miramos que los tipos no coincidan con los del dia actual
     (not (tipoFirst ?f ?t1))
     (not (tipoSecond ?s ?t2))

     

    ;Comprobamos que las calorias del dia esten dentro de los limites
     (>= (+ (caloriasFirst ?f) (caloriasSecond ?s) 1000)
     (<= (+ (caloriasFirst ?f) (caloriasSecond ?s) 1000)



	)
    :effect 
	  (and (asigned ?d ?f ?s)
      (repetidoFirst ?f)
      (repetidoSecond ?s)
      ;En los juegos de prueba hay que minimizar este apartado utilizando
      ; (:metric minimize (precioTotal)) en :goal
      (increase (precioTotal) (+ (precioFirst ?f) (precioSecond ?s))) 
      )
  )
)