(define (problem menu-semanal-e2)
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
    ; Asociación de cada plato con su tipo
    (es_tipo p1 sopa)        ; p1 = sopa de verduras
    (es_tipo p2 ensalada)    ; p2 = ensalada mixta  
    (es_tipo p3 crema)       ; p3 = crema de champiñones
    (es_tipo p4 pescado)     ; p4 = paella (primer plato de pescado)
    (es_tipo p5 ensalada)    ; p5 = ensalada césar
    
    (es_tipo s1 carne)       ; s1 = filete de ternera
    (es_tipo s2 pescado)     ; s2 = salmón (segundo plato de pescado)
    (es_tipo s3 carne)       ; s3 = pollo asado
    (es_tipo s4 pescado)     ; s4 = lubina (segundo plato de pescado)
    (es_tipo s5 carne)       ; s5 = cerdo a la plancha
    
    ; Orden de los días (día_siguiente día_anterior día_actual) 
    (dia_siguiente lun mar)
    (dia_siguiente mar mie)
    (dia_siguiente mie jue)
    (dia_siguiente jue vie)
    
    ; Incompatibilidades entre platos
    (incompatible p1 s2)     ; sopa de verduras no va con salmón
    (incompatible p2 s1)     ; ensalada mixta no va con filete
    (incompatible p3 s3)     ; crema de champiñones no va con pollo
    (incompatible p4 s4)     ; paella no va con lubina (demasiado pescado)
    (incompatible p5 s5)     ; ensalada césar no va con cerdo
    
    ; Estado inicial - todos los días tienen espacios libres
    (primero_libre lun)
    (primero_libre mar)
    (primero_libre mie)
    (primero_libre jue)
    (primero_libre vie)
    
    (segundo_libre lun)
    (segundo_libre mar)
    (segundo_libre mie)
    (segundo_libre jue)
    (segundo_libre vie)
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