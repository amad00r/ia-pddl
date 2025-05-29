(define (problem menu-semanal-extension5)
  (:domain menu_semanal)
  (:objects 
    ; Primeros platos (10 en total)
    p1 p2 p3 p4 p5 p51 - primero
    ; Segundos platos (10 en total)
    s1 s2 s3 s4 s5 s51 - segundo
    ; Días de la semana
    lun mar mie jue vie - dia
    ; Tipos de platos
    sopa ensalada crema carne pescado pasta legumbres - tipo_plato
  )
  (:init 
    ; Platos obligatorios <- FORZAR QUE COJA EL 5 o 51 en funcion del precio.
    (obligatorio_dia p1 lun)         
    (obligatorio_dia p2 mie)
    (obligatorio_dia p3 mar)         
    (obligatorio_dia p4 jue)

    (obligatorio_dia s1 lun)         
    (obligatorio_dia s2 mie)
    (obligatorio_dia s3 mar)         
    (obligatorio_dia s4 jue) 

    ; Asociación de cada plato con su tipo
    (es_tipo p1 sopa)        
    (es_tipo p2 sopa)     
    (es_tipo p3 ensalada)       
    (es_tipo p4 ensalada)     
    (es_tipo p5 legumbres)       
    (es_tipo p51 legumbres)   

    (es_tipo s1 carne)       
    (es_tipo s2 carne)     
    (es_tipo s3 pasta)        
    (es_tipo s4 pasta)     
    (es_tipo s5 legumbres)          
    (es_tipo s51 legumbres)      
    
    ; Calorías de los platos <- TODAS 500 forzar okey.
    (= (calorias p1) 500)    
    (= (calorias p2) 500)    
    (= (calorias p3) 500)    
    (= (calorias p4) 500)    
    (= (calorias p5) 500)       
    (= (calorias p51) 500)
    
    (= (calorias s1) 500)    
    (= (calorias s2) 500)    
    (= (calorias s3) 500)    
    (= (calorias s4) 500)    
    (= (calorias s5) 500)     
    (= (calorias s51) 500)    
    
    ; Precios de los platos
    (= (precio p1) 10.00)     
    (= (precio p2) 10.00)     
    (= (precio p3) 10.00)     
    (= (precio p4) 10.00)     
    (= (precio p5) 10.00)        
    (= (precio p51) 10.50)     
    
    (= (precio s1) 10.00)    
    (= (precio s2) 10.00)   
    (= (precio s3) 10.00)     
    (= (precio s4) 10.00)    
    (= (precio s5) 10.00)        
    (= (precio s51) 10.50)   
    
    ; Inicializar contadores
    (= (calorias_dia lun) 0)
    (= (calorias_dia mar) 0)
    (= (calorias_dia mie) 0)
    (= (calorias_dia jue) 0)
    (= (calorias_dia vie) 0)
    (= (precio_total) 0)     
    
    ; Orden de los días
    (dia_siguiente lun mar)
    (dia_siguiente mar mie)
    (dia_siguiente mie jue)
    (dia_siguiente jue vie)
    
    ; Incompatibilidades
    ; (incompatible p2 s1)     
    ; (incompatible p1 s5)     
    ; (incompatible p6 s2)     
    ; (incompatible p7 s7)     
    ; (incompatible p9 s3)     
    ; (incompatible p5 s10)    
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