(define (problem menu-semanal-extension5)
  (:domain menu_semanal)
  (:objects 
    ; Primeros platos (10 en total)
    p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - primero
    ; Segundos platos (10 en total)
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - segundo
    ; Días de la semana
    lun mar mie jue vie - dia
    ; Tipos de platos
    sopa ensalada crema carne pescado pasta legumbres - tipo_plato
  )
  (:init 
    ; Platos obligatorios
    ; (obligatorio_dia p4 jue)         ; paella obligatoria los jueves
    ; (obligatorio_dia s3 vie)         ; sopa de pollo obligatoria los viernes
    
    ; Asociación de cada plato con su tipo
    (es_tipo p1 sopa)        ; p1 = sopa de verduras
    (es_tipo p2 ensalada)    ; p2 = ensalada mixta  
    (es_tipo p3 crema)       ; p3 = crema de champiñones
    (es_tipo p4 pescado)     ; p4 = paella
    (es_tipo p5 ensalada)    ; p5 = ensalada césar
    (es_tipo p6 pasta)       ; p6 = espaguetis con tomate
    (es_tipo p7 legumbres)   ; p7 = lentejas
    (es_tipo p8 crema)       ; p8 = crema de calabaza
    (es_tipo p9 pasta)       ; p9 = macarrones con queso
    (es_tipo p10 legumbres)  ; p10 = garbanzos
    
    (es_tipo s1 carne)       ; s1 = filete de ternera
    (es_tipo s2 pescado)     ; s2 = salmón
    (es_tipo s3 sopa)        ; s3 = sopa de pollo
    (es_tipo s4 pescado)     ; s4 = lubina
    (es_tipo s5 carne)       ; s5 = cerdo a la plancha
    (es_tipo s6 carne)       ; s6 = pollo asado
    (es_tipo s7 pescado)     ; s7 = merluza
    (es_tipo s8 carne)       ; s8 = albóndigas
    (es_tipo s9 pescado)     ; s9 = dorada
    (es_tipo s10 carne)      ; s10 = lomo de cordero
    
    ; Calorías de los platos
    (= (calorias p1) 400)    ; sopa de verduras
    (= (calorias p2) 300)    ; ensalada mixta
    (= (calorias p3) 450)    ; crema de champiñones
    (= (calorias p4) 550)    ; paella
    (= (calorias p5) 350)    ; ensalada césar
    (= (calorias p6) 500)    ; espaguetis con tomate
    (= (calorias p7) 420)    ; lentejas
    (= (calorias p8) 380)    ; crema de calabaza
    (= (calorias p9) 520)    ; macarrones con queso
    (= (calorias p10) 480)   ; garbanzos
    
    (= (calorias s1) 700)    ; filete de ternera
    (= (calorias s2) 600)    ; salmón
    (= (calorias s3) 550)    ; sopa de pollo
    (= (calorias s4) 500)    ; lubina
    (= (calorias s5) 700)    ; cerdo a la plancha
    (= (calorias s6) 650)    ; pollo asado
    (= (calorias s7) 520)    ; merluza
    (= (calorias s8) 680)    ; albóndigas
    (= (calorias s9) 550)    ; dorada
    (= (calorias s10) 750)   ; lomo de cordero
    
    ; Precios de los platos
    (= (precio p1) 3.50)     ; sopa de verduras
    (= (precio p2) 4.00)     ; ensalada mixta
    (= (precio p3) 4.50)     ; crema de champiñones
    (= (precio p4) 8.00)     ; paella
    (= (precio p5) 5.50)     ; ensalada césar
    (= (precio p6) 4.50)     ; espaguetis con tomate
    (= (precio p7) 4.75)     ; lentejas
    (= (precio p8) 4.25)     ; crema de calabaza
    (= (precio p9) 5.00)     ; macarrones con queso
    (= (precio p10) 4.00)    ; garbanzos
    
    (= (precio s1) 12.00)    ; filete de ternera
    (= (precio s2) 10.50)    ; salmón
    (= (precio s3) 7.50)     ; sopa de pollo
    (= (precio s4) 11.00)    ; lubina
    (= (precio s5) 9.50)     ; cerdo a la plancha
    (= (precio s6) 8.50)     ; pollo asado
    (= (precio s7) 9.75)     ; merluza
    (= (precio s8) 8.25)     ; albóndigas
    (= (precio s9) 12.50)    ; dorada
    (= (precio s10) 1.00)   ; lomo de cordero
    
    ; Inicializar contadores
    (= (calorias_dia lun) 0)
    (= (calorias_dia mar) 0)
    (= (calorias_dia mie) 0)
    (= (calorias_dia jue) 0)
    (= (calorias_dia vie) 0)
    (= (precio_total) 0)     ; Inicializamos el precio total a 0
    
    ; Orden de los días
    (dia_siguiente lun mar)
    (dia_siguiente mar mie)
    (dia_siguiente mie jue)
    (dia_siguiente jue vie)
    
    ; Incompatibilidades
    ; (incompatible p2 s1)     ; ensalada mixta no va con filete
    ; (incompatible p1 s5)     ; sopa no va con cerdo
    ; (incompatible p6 s2)     ; espaguetis no va con salmón
    ; (incompatible p7 s7)     ; lentejas no va con merluza
    ; (incompatible p9 s3)     ; macarrones no va con sopa de pollo
    ; (incompatible p5 s10)    ; ensalada césar no va con cordero
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
  
  (:metric minimize (precio_total))
)