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
    )

    (:action asignar_primero
        :parameters (?p - primero ?d - dia)
        :precondition (and 
            (not (asignado_primero ?p ?d))
            (not (exists (?p2 - primero) (asignado_primero ?p2 ?d)))
        )
        :effect (and 
            (asignado_primero ?p ?d)
        )
    )
    
    (:action asignar_segundo
        :parameters (?s - segundo ?d - dia)
        :precondition (and 
            (not (asignado_segundo ?s ?d))
            (not (exists (?s2 - segundo) (asignado_segundo ?s2 ?d)))
            (exists (?p - primero) (asignado_primero ?p ?d))
            (forall (?p - primero) 
                (imply (asignado_primero ?p ?d) (not (incompatible ?p ?s))))
        )
        :effect (and 
            (asignado_segundo ?s ?d)
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