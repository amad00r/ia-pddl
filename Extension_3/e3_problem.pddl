(define (problem menu-semanal-intermedio)
  (:domain menu_semanal)
  (:objects 
    ; Primeros platos
    p1 p2 p3 p4 p5 - primero
    ; Segundos platos  
    s1 s2 s3 s4 s5 - segundo
    ; Días de la semana
    lun mar mie jue vie - dia
    ; Tipos de platos
    sopa ensalada crema carne pescado - tipo_plato
  )
  (:init 
    ; Platos obligatorios
    (obligatorio_dia p4 jue)         ; paella obligatoria los jueves
    (obligatorio_dia s3 vie)         ; sopa de pollo obligatoria los viernes
    
    ; Asociación de cada plato con su tipo
    (es_tipo p1 sopa)        ; p1 = sopa de verduras
    (es_tipo p2 ensalada)    ; p2 = ensalada mixta  
    (es_tipo p3 crema)       ; p3 = crema de champiñones
    (es_tipo p4 pescado)     ; p4 = paella
    (es_tipo p5 ensalada)    ; p5 = ensalada césar
    
    (es_tipo s1 carne)       ; s1 = filete de ternera
    (es_tipo s2 pescado)     ; s2 = salmón
    (es_tipo s3 sopa)        ; s3 = sopa de pollo
    (es_tipo s4 pescado)     ; s4 = lubina
    (es_tipo s5 carne)       ; s5 = cerdo a la plancha
    
    ; Orden de los días
    (dia_siguiente lun mar)
    (dia_siguiente mar mie)
    (dia_siguiente mie jue)
    (dia_siguiente jue vie)
    
    ; Incompatibilidades
    (incompatible p2 s1)     ; ensalada mixta no va con filete
    (incompatible p1 s5)     ; sopa no va con cerdo
  )
  (:goal 
    (and 
      (dia_completo lun)
      (dia_completo mar) 
      (dia_completo mie)
      (dia_completo jue)
      (dia_completo vie)
    )
  )
)