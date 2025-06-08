(define (problem menu-semanal-extension-e1)
	(:domain menu_semanal)
	(:objects
		lun mar mie jue vie - dia
		crema ensalada carne sopa pescado arroz - tipo_plato
		sopa_de_tomate sopa_de_pollo sopa_de_verduras ensalada_de_quinoa ensalada_griega ensalada_caprese ensalada_de_atun ensalada_cesar crema_de_esparragos crema_de_champinones crema_de_aguacate crema_de_zanahoria crema_de_calabaza - primero
		costillas_a_la_barbacoa albondigas estofado_de_cordero filete_de_ternera pollo_asado salmon_a_la_plancha atun_a_la_parrilla arroz_a_la_cubana arroz_meloso_de_verduras paella_mixta arroz_con_costra - segundo
	)

	(:init
		(es_tipo sopa_de_tomate sopa)
		(es_tipo sopa_de_pollo sopa)
		(es_tipo sopa_de_verduras sopa)
		(es_tipo ensalada_de_quinoa ensalada)
		(es_tipo ensalada_griega ensalada)
		(es_tipo ensalada_caprese ensalada)
		(es_tipo ensalada_de_atun ensalada)
		(es_tipo ensalada_cesar ensalada)
		(es_tipo crema_de_esparragos crema)
		(es_tipo crema_de_champinones crema)
		(es_tipo crema_de_aguacate crema)
		(es_tipo crema_de_zanahoria crema)
		(es_tipo crema_de_calabaza crema)

		(es_tipo costillas_a_la_barbacoa carne)
		(es_tipo albondigas carne)
		(es_tipo estofado_de_cordero carne)
		(es_tipo filete_de_ternera carne)
		(es_tipo pollo_asado carne)
		(es_tipo salmon_a_la_plancha pescado)
		(es_tipo atun_a_la_parrilla pescado)
		(es_tipo arroz_a_la_cubana arroz)
		(es_tipo arroz_meloso_de_verduras arroz)
		(es_tipo paella_mixta arroz)
		(es_tipo arroz_con_costra arroz)

		(incompatible sopa_de_pollo costillas_a_la_barbacoa)
		(incompatible sopa_de_verduras estofado_de_cordero)
		(incompatible sopa_de_tomate atun_a_la_parrilla)
		(incompatible ensalada_cesar pollo_asado)
		(incompatible ensalada_de_atun atun_a_la_parrilla)
		(incompatible crema_de_calabaza paella_mixta)
		(incompatible crema_de_champinones arroz_con_costra)
		(incompatible crema_de_esparragos arroz_a_la_cubana)
		(incompatible crema_de_zanahoria arroz_meloso_de_verduras)
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
