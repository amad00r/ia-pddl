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


    )

    (:action asignar_primero
        :parameters (?p - primero ?d - dia)
        :precondition (and 
            (not (asignado_primero ?p ?d))
            (not (primero_usado ?p))
            (not (exists (?p2 - primero) (asignado_primero ?p2 ?d)))
        )
        :effect (and 
            (asignado_primero ?p ?d)
            (primero_usado ?p)
        )
    )
    
    (:action asignar_segundo
        :parameters (?s - segundo ?d - dia)
        :precondition (and 
            (not (asignado_segundo ?s ?d))
            (not (segundo_usado ?s))
            (not (exists (?s2 - segundo) (asignado_segundo ?s2 ?d)))
            (exists (?p - primero) (asignado_primero ?p ?d))
            (forall (?p - primero) 
                (imply (asignado_primero ?p ?d) (not (incompatible ?p ?s))))
        )
        :effect (and 
            (asignado_segundo ?s ?d)
            (segundo_usado ?s)
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