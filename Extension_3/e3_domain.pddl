(define (domain menu_semanal)
    (:requirements :strips :typing :equality)
    (:types
        plato dia tipo_plato - object
        primero segundo - plato
    )
    (:predicates
        (incompatible ?p1 - primero ?s2 - segundo)
        (asignado_primero ?p - primero ?d - dia)
        (asignado_segundo ?s - segundo ?d - dia)
        (dia_completo ?d - dia)
        (primero_libre ?d - dia)
        (segundo_libre ?d - dia)
        (primero_usado ?p - primero)
        (segundo_usado ?s - segundo)
        (es_tipo ?p - plato ?t - tipo_plato)
        (tipo_primero_usado ?t - tipo_plato ?d - dia)
        (tipo_segundo_usado ?t - tipo_plato ?d - dia)
        (dia_siguiente ?d1 - dia ?d2 - dia)
        (obligatorio_dia ?p - plato ?d - dia)
    )
    (:action asignar_primero
    :parameters (?p - primero ?d - dia ?t - tipo_plato)
    :precondition (and 
        (primero_libre ?d)
        (not (primero_usado ?p))
        (es_tipo ?p ?t)
        ; Verificar que si hay plato obligatorio para este día, debe ser este plato
        (forall (?p_obl - primero)
            (imply (obligatorio_dia ?p_obl ?d) (= ?p ?p_obl)))
        ; Verificar que no se repita el mismo tipo en días consecutivos (anterior Y siguiente)
        (forall (?d_ant - dia)
            (imply (dia_siguiente ?d_ant ?d)
                (not (tipo_primero_usado ?t ?d_ant))))
        (forall (?d_sig - dia)
            (imply (dia_siguiente ?d ?d_sig)
                (not (tipo_primero_usado ?t ?d_sig))))
    )
    :effect (and 
        (asignado_primero ?p ?d)
        (not (primero_libre ?d))
        (primero_usado ?p)
        (tipo_primero_usado ?t ?d)
    )
)

(:action asignar_segundo
    :parameters (?s - segundo ?d - dia ?t - tipo_plato)
    :precondition (and 
        (segundo_libre ?d)
        (not (segundo_usado ?s))
        (es_tipo ?s ?t)
        ; Verificar que si hay plato obligatorio para este día, debe ser este plato
        (forall (?s_obl - segundo)
            (imply (obligatorio_dia ?s_obl ?d) (= ?s ?s_obl)))
        ; Verificar que no se repita el mismo tipo en días consecutivos (anterior Y siguiente)
        (forall (?d_ant - dia)
            (imply (dia_siguiente ?d_ant ?d)
                (not (tipo_segundo_usado ?t ?d_ant))))
        (forall (?d_sig - dia)
            (imply (dia_siguiente ?d ?d_sig)
                (not (tipo_segundo_usado ?t ?d_sig))))
        ; Verificar compatibilidad con el primer plato del día
        (forall (?p - primero) 
            (imply (asignado_primero ?p ?d) (not (incompatible ?p ?s))))
    )
    :effect (and 
        (asignado_segundo ?s ?d)
        (not (segundo_libre ?d))
        (segundo_usado ?s)
        (tipo_segundo_usado ?t ?d)
    )
)
    (:action completar_dia
        :parameters (?d - dia)
        :precondition (and 
            (not (primero_libre ?d))
            (not (segundo_libre ?d))
            (not (dia_completo ?d))
        )
        :effect (dia_completo ?d)
    )
)