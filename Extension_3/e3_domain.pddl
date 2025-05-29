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
        (primero_usado ?p - primero)
        (segundo_usado ?s - segundo)
        (es_tipo ?p - plato ?t - tipo_plato)
        (tipo_usado ?t - tipo_plato ?d - dia)
        (dia_siguiente ?d1 - dia ?d2 - dia)
        (obligatorio_dia ?p - plato ?d - dia)
        (tipo_asignado_dia ?t - tipo_plato ?d - dia)
    )

    (:action asignar_primero
        :parameters (?p - primero ?d - dia ?t - tipo_plato)
        :precondition (and 
            (not (asignado_primero ?p ?d))
            (not (primero_usado ?p))
            (not (exists (?p2 - primero) (asignado_primero ?p2 ?d)))
            (es_tipo ?p ?t)
            ; Verificar platos obligatorios
            (forall (?p_obl - primero)
                (imply (obligatorio_dia ?p_obl ?d) (= ?p ?p_obl)))
            ; No repetir tipo en días consecutivos
            (forall (?d_ant - dia)
                (imply (dia_siguiente ?d_ant ?d)
                    (not (tipo_usado ?t ?d_ant))))
        )
        :effect (and 
            (asignado_primero ?p ?d)
            (primero_usado ?p)
            ; Marcar el tipo como usado en el día y registrar la asignación
            (tipo_usado ?t ?d)
            (tipo_asignado_dia ?t ?d)
        )
    )
    
    (:action asignar_segundo
        :parameters (?s - segundo ?d - dia ?t - tipo_plato)
        :precondition (and 
            (not (asignado_segundo ?s ?d))
            (not (segundo_usado ?s))
            (not (exists (?s2 - segundo) (asignado_segundo ?s2 ?d)))
            (exists (?p - primero) (asignado_primero ?p ?d))
            ; El plato debe ser del tipo especificado
            (es_tipo ?s ?t)
            ; Verificar platos obligatorios
            (forall (?s_obl - segundo)
                (imply (obligatorio_dia ?s_obl ?d) (= ?s ?s_obl)))
            ; No repetir tipo en días consecutivos
            (forall (?d_ant - dia)
                (imply (dia_siguiente ?d_ant ?d)
                    (not (tipo_usado ?t ?d_ant))))
            ; No incompatibilidad con el primero ya asignado
            (forall (?p - primero) 
                (imply (asignado_primero ?p ?d) (not (incompatible ?p ?s))))
            ; El segundo no puede tener el mismo tipo que el primero del mismo día
            (not (tipo_asignado_dia ?t ?d))
        )
        :effect (and 
            (asignado_segundo ?s ?d)
            (segundo_usado ?s)
            (tipo_usado ?t ?d)
            (tipo_asignado_dia ?t ?d)
        )
    )

    (:action completar_dia
        :parameters (?d - dia)
        :precondition (and 
            (exists (?p - primero) (asignado_primero ?p ?d))
            (exists (?s - segundo) (asignado_segundo ?s ?d))
            (not (dia_completo ?d))
        )
        :effect (dia_completo ?d)
    )
)