(define (problem menu-semanal-base)
  (:domain menu_semanal)
  (:objects 
    ; Primeros platos
    p1 p2 p3 p4 p5 - primero
    ; Segundos platos  
    s1 s2 s3 s4 s5 - segundo
    ; Días de la semana
    lun mar mie jue vie - dia
  )
  (:init 
    ; Incompatibilidades entre platos
    (incompatible p1 s2)
    (incompatible p2 s1)
    (incompatible p3 s3)
    (incompatible p4 s4)
    (incompatible p5 s5)
    
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