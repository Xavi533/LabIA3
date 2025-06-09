(define (problem ricorico-ext3-joc1)
  (:domain ricorico-ext3)
  
  (:objects
    ; Primeros
    crema-calabaza lentejas-estofadas arroz-tres-delicias fideos-marinera tortilla-patatas sopa-pescado ensalada-mixta gazpacho - primero

    ; Segundos
    bacalao-horno albondigas-salsa pechuga-plancha cordero-asado calamar-romana hamburguesa queso-cabra salchichas - segundo

    ; Días
    lunes martes miercoles jueves viernes - dia

    ; Tipos de plato
    crema legumbre arroz pasta huevo pescado carne frito ensalada sopa - tipo-plato
  )

  (:init
    ; Días sin menú
    (dia-sin-menu lunes)
    (dia-sin-menu martes)
    (dia-sin-menu miercoles)
    (dia-sin-menu jueves)
    (dia-sin-menu viernes)

    ; Orden de días
    (primer-dia lunes)
    (siguiente-dia lunes martes)
    (siguiente-dia martes miercoles)
    (siguiente-dia miercoles jueves)
    (siguiente-dia jueves viernes)

    ; Tipos de primeros
    (es-tipo-primero crema-calabaza crema)
    (es-tipo-primero lentejas-estofadas legumbre)
    (es-tipo-primero arroz-tres-delicias arroz)
    (es-tipo-primero fideos-marinera pasta)
    (es-tipo-primero tortilla-patatas huevo)
    (es-tipo-primero sopa-pescado sopa)
    (es-tipo-primero ensalada-mixta ensalada)
    (es-tipo-primero gazpacho sopa)

    ; Tipos de segundos
    (es-tipo-segundo bacalao-horno pescado)
    (es-tipo-segundo albondigas-salsa carne)
    (es-tipo-segundo pechuga-plancha carne)
    (es-tipo-segundo cordero-asado carne)
    (es-tipo-segundo calamar-romana frito)
    (es-tipo-segundo hamburguesa carne)
    (es-tipo-segundo queso-cabra frito)
    (es-tipo-segundo salchichas carne)

    ; Ignoramos incompatibilidades en esta prueba

    ; Imposición del cliente: primeros
    (primero-en-dia lunes crema-calabaza)
    (not (dia-sin-menu lunes))
    (primero-usado crema-calabaza)
    (dia-tiene-tipo-primero lunes crema)

    (primero-en-dia miercoles tortilla-patatas)
    (not (dia-sin-menu miercoles))
    (primero-usado tortilla-patatas)
    (dia-tiene-tipo-primero miercoles huevo)

    (primero-en-dia viernes gazpacho)
    (not (dia-sin-menu viernes))
    (primero-usado gazpacho)
    (dia-tiene-tipo-primero viernes sopa)

    ; Imposición del cliente: segundos
    (segundo-en-dia martes bacalao-horno)
    (not (dia-sin-menu martes))
    (segundo-usado bacalao-horno)
    (dia-tiene-tipo-segundo martes pescado)


    (segundo-en-dia jueves albondigas-salsa)
    (not (dia-sin-menu jueves))
    (segundo-usado albondigas-salsa)
    (dia-tiene-tipo-segundo jueves carne)
  )

  (:goal 
    (and
      (dia-asignado lunes)
      (dia-asignado martes)
      (dia-asignado miercoles)
      (dia-asignado jueves)
      (dia-asignado viernes)
    )
  )
)