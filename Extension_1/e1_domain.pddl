(define (domain menu_semanal)
    (:requirements :strips :typing)
    (:types
        plato dia - object
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
    )
    (:action asignar_primero
        :parameters (?p - primero ?d - dia)
        :precondition (and 
            (primero_libre ?d)
            (not (primero_usado ?p))
        )
        :effect (and 
            (asignado_primero ?p ?d)
            (not (primero_libre ?d))
            (primero_usado ?p)
        )
    )
    (:action asignar_segundo
        :parameters (?s - segundo ?d - dia)
        :precondition (and 
            (segundo_libre ?d)
            (not (segundo_usado ?s))
            (forall (?p - primero) 
                (imply (asignado_primero ?p ?d) (not (incompatible ?p ?s))))
        )
        :effect (and 
            (asignado_segundo ?s ?d)
            (not (segundo_libre ?d))
            (segundo_usado ?s)
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