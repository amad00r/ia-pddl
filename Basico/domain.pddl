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
        (es_tipo ?p - plato ?t - tipo_plato)
        (dia_siguiente ?d1 - dia ?d2 - dia)
        (tipo_primero_usado ?t - tipo_plato ?d - dia)
        (tipo_segundo_usado ?t - tipo_plato ?d - dia)
    )

    (:action asignar_primero
        :parameters (?p - primero ?d - dia ?t - tipo_plato)
        :precondition (and 
            (not (asignado_primero ?p ?d))
            (es_tipo ?p ?t)
            (not (tipo_primero_usado ?t ?d))
        )
        :effect (and 
            (asignado_primero ?p ?d)
            (tipo_primero_usado ?t ?d)
        )
    )

    (:action asignar_segundo
        :parameters (?s - segundo ?d - dia ?t - tipo_plato)
        :precondition (and 
            (not (asignado_segundo ?s ?d))
            (es_tipo ?s ?t)
            (not (tipo_segundo_usado ?t ?d))
            (not (exists (?p - primero)
                (and 
                    (asignado_primero ?p ?d)
                    (incompatible ?p ?s)
                )
            ))
        )
        :effect (and 
            (asignado_segundo ?s ?d)
            (tipo_segundo_usado ?t ?d)
        )
    )

    (:action marcar_dia_completo
        :parameters (?d - dia)
        :precondition (and 
            (exists (?p - primero) (asignado_primero ?p ?d))
            (exists (?s - segundo) (asignado_segundo ?s ?d))
            (not (dia_completo ?d))
        )
        :effect (dia_completo ?d)
    )
)