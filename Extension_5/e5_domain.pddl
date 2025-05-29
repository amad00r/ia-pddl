(define (domain menu_semanal)
    (:requirements :strips :typing :equality :fluents)
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
        (tipo_primero_usado ?t - tipo_plato ?d - dia)
        (tipo_segundo_usado ?t - tipo_plato ?d - dia)
    )

    (:functions
        (calorias ?p - plato)
        (calorias_dia ?d - dia)
        (precio ?p - plato)        ;; Precio de cada plato
        (precio_total)             ;; Precio total del menú semanal
    )

    (:action asignar_primero
        :parameters (?p - primero ?d - dia ?t - tipo_plato)
        :precondition (and 
            (not (asignado_primero ?p ?d))
            (not (primero_usado ?p))
            (es_tipo ?p ?t)
            (not (tipo_primero_usado ?t ?d))
            (forall (?d2 - dia)
                (imply (dia_siguiente ?d2 ?d)
                    (not (tipo_primero_usado ?t ?d2))
                )
            )
            (forall (?d2 - dia)
                (imply (dia_siguiente ?d ?d2)
                    (not (tipo_primero_usado ?t ?d2))
                )
            )
            (or
                (obligatorio_dia ?p ?d)
                (not (exists (?p2 - primero) 
                    (obligatorio_dia ?p2 ?d)))
            )
        )
        :effect (and 
            (asignado_primero ?p ?d)
            (primero_usado ?p)
            (tipo_primero_usado ?t ?d)
            (tipo_usado ?t ?d)
            (increase (calorias_dia ?d) (calorias ?p))
            (increase (precio_total) (precio ?p))  ;; Añadimos el precio del plato al total
        )
    )

    (:action asignar_segundo
        :parameters (?s - segundo ?d - dia ?t - tipo_plato)
        :precondition (and 
            (not (asignado_segundo ?s ?d))
            (not (segundo_usado ?s))
            (es_tipo ?s ?t)
            (not (tipo_segundo_usado ?t ?d))
            (forall (?d2 - dia)
                (imply (dia_siguiente ?d2 ?d)
                    (not (tipo_segundo_usado ?t ?d2))
                )
            )
            (forall (?d2 - dia)
                (imply (dia_siguiente ?d ?d2)
                    (not (tipo_segundo_usado ?t ?d2))
                )
            )
            (or
                (obligatorio_dia ?s ?d)
                (not (exists (?s2 - segundo) 
                    (obligatorio_dia ?s2 ?d)))
            )
            (not (exists (?p - primero)
                (and 
                    (asignado_primero ?p ?d)
                    (incompatible ?p ?s)
                )
            ))
            (exists (?p - primero)
                (and 
                    (asignado_primero ?p ?d)
                    (>= (+ (calorias_dia ?d) (calorias ?s)) 1000)
                    (<= (+ (calorias_dia ?d) (calorias ?s)) 1500)
                )
            )
        )
        :effect (and 
            (asignado_segundo ?s ?d)
            (segundo_usado ?s)
            (tipo_segundo_usado ?t ?d)
            (tipo_usado ?t ?d)
            (increase (calorias_dia ?d) (calorias ?s))
            (increase (precio_total) (precio ?s))  ;; Añadimos el precio del plato al total
        )
    )

    (:action marcar_dia_completo
        :parameters (?d - dia)
        :precondition (and 
            (exists (?p - primero) (asignado_primero ?p ?d))
            (exists (?s - segundo) (asignado_segundo ?s ?d))
            (not (dia_completo ?d))
            (>= (calorias_dia ?d) 1000)
            (<= (calorias_dia ?d) 1500)
        )
        :effect (dia_completo ?d)
    )
)