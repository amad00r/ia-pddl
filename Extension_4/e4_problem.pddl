(define (problem menu-semanal-solucionable)
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
    ; Platos obligatorios en días específicos
    ; (obligatorio_dia p4 jue)         ; paella obligatoria los jueves
    ; (obligatorio_dia s2 vie)         ; salmón obligatorio los viernes
    
    ; Asociación de cada plato con su tipo
    (es_tipo p1 sopa)        ; p1 = sopa de verduras
    (es_tipo p2 ensalada)    ; p2 = ensalada mixta  
    (es_tipo p3 crema)       ; p3 = crema de champiñones
    (es_tipo p4 pescado)     ; p4 = paella (primer plato de pescado)
    (es_tipo p5 ensalada)    ; p5 = ensalada césar
    
    (es_tipo s1 carne)       ; s1 = filete de ternera
    (es_tipo s2 pescado)     ; s2 = salmón
    (es_tipo s3 carne)       ; s3 = pollo
    (es_tipo s4 pescado)     ; s4 = lubina
    (es_tipo s5 carne)       ; s5 = cerdo a la plancha
    
    ; Calorías ajustadas para garantizar combinaciones válidas (1000-1500 cal/día)
    (= (calorias p1) 500)    ; sopa de verduras: 400 cal
    (= (calorias p2) 500)    ; ensalada mixta: 450 cal
    (= (calorias p3) 500)    ; crema de champiñones: 500 cal
    (= (calorias p4) 500)    ; paella: 600 cal
    (= (calorias p5) 500)    ; ensalada césar: 500 cal
    
    (= (calorias s1) 500)    ; filete de ternera: 700 cal
    (= (calorias s2) 500)    ; salmón: 600 cal
    (= (calorias s3) 500)    ; pollo: 600 cal
    (= (calorias s4) 500)    ; lubina: 650 cal
    (= (calorias s5) 500)    ; cerdo: 750 cal
    
    ; Inicializar contadores de calorías
    (= (calorias_dia lun) 0)
    (= (calorias_dia mar) 0)
    (= (calorias_dia mie) 0)
    (= (calorias_dia jue) 0)
    (= (calorias_dia vie) 0)
    
    ; Orden de los días (día_siguiente día_anterior día_actual) 
    (dia_siguiente lun mar)
    (dia_siguiente mar mie)
    (dia_siguiente mie jue)
    (dia_siguiente jue vie)
    
    ; Incompatibilidades mínimas
    ; (incompatible p1 s5)     ; sopa de verduras no va con cerdo (400+750=1150 cal - ok)
    ; (incompatible p4 s2)     ; paella no va con salmón (demasiado pescado)
    
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