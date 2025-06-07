(define (problem menu-semanal-extension-e0)
	(:domain menu_semanal)
	(:objects
		lun mar mie jue vie - dia
		crema carne pescado ensalada arroz sopa - tipo_plato
		sopa_de_verduras sopa_de_tomate ensalada_cesar ensalada_griega ensalada_de_quinoa crema_de_aguacate crema_de_calabaza - primero
		estofado_de_cordero costillas_a_la_barbacoa albondigas atun_a_la_parrilla salmon_a_la_plancha bacalao_al_horno arroz_al_horno arroz_a_la_cubana arroz_con_costra paella_mixta arroz_meloso_de_verduras - segundo
	)

	(:init
		(es_tipo sopa_de_verduras sopa)
		(es_tipo sopa_de_tomate sopa)
		(es_tipo ensalada_cesar ensalada)
		(es_tipo ensalada_griega ensalada)
		(es_tipo ensalada_de_quinoa ensalada)
		(es_tipo crema_de_aguacate crema)
		(es_tipo crema_de_calabaza crema)

		(es_tipo estofado_de_cordero carne)
		(es_tipo costillas_a_la_barbacoa carne)
		(es_tipo albondigas carne)
		(es_tipo atun_a_la_parrilla pescado)
		(es_tipo salmon_a_la_plancha pescado)
		(es_tipo bacalao_al_horno pescado)
		(es_tipo arroz_al_horno arroz)
		(es_tipo arroz_a_la_cubana arroz)
		(es_tipo arroz_con_costra arroz)
		(es_tipo paella_mixta arroz)
		(es_tipo arroz_meloso_de_verduras arroz)

		(incompatible sopa_de_verduras estofado_de_cordero)
		(incompatible sopa_de_tomate atun_a_la_parrilla)
		(incompatible ensalada_de_quinoa bacalao_al_horno)
		(incompatible crema_de_calabaza paella_mixta)
		(incompatible crema_de_aguacate albondigas)
		(incompatible ensalada_cesar estofado_de_cordero)

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
