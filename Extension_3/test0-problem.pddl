(define (problem menu-semanal-extension-e3)
	(:domain menu_semanal)
	(:objects
		lun mar mie jue vie - dia
		pescado crema ensalada arroz carne sopa - tipo_plato
		sopa_de_tomate sopa_de_lentejas ensalada_de_atun ensalada_de_quinoa ensalada_cesar ensalada_caprese ensalada_griega crema_de_calabaza crema_de_zanahoria crema_de_aguacate crema_de_champinones crema_de_esparragos - primero
		albondigas costillas_a_la_barbacoa estofado_de_cordero pollo_asado calamares_a_la_romana salmon_a_la_plancha atun_a_la_parrilla paella_mixta arroz_con_costra arroz_meloso_de_verduras arroz_a_la_cubana - segundo
	)

	(:init
		(es_tipo sopa_de_tomate sopa)
		(es_tipo sopa_de_lentejas sopa)
		(es_tipo ensalada_de_atun ensalada)
		(es_tipo ensalada_de_quinoa ensalada)
		(es_tipo ensalada_cesar ensalada)
		(es_tipo ensalada_caprese ensalada)
		(es_tipo ensalada_griega ensalada)
		(es_tipo crema_de_calabaza crema)
		(es_tipo crema_de_zanahoria crema)
		(es_tipo crema_de_aguacate crema)
		(es_tipo crema_de_champinones crema)
		(es_tipo crema_de_esparragos crema)

		(es_tipo albondigas carne)
		(es_tipo costillas_a_la_barbacoa carne)
		(es_tipo estofado_de_cordero carne)
		(es_tipo pollo_asado carne)
		(es_tipo calamares_a_la_romana pescado)
		(es_tipo salmon_a_la_plancha pescado)
		(es_tipo atun_a_la_parrilla pescado)
		(es_tipo paella_mixta arroz)
		(es_tipo arroz_con_costra arroz)
		(es_tipo arroz_meloso_de_verduras arroz)
		(es_tipo arroz_a_la_cubana arroz)

		(incompatible sopa_de_tomate atun_a_la_parrilla)
		(incompatible ensalada_cesar pollo_asado)
		(incompatible ensalada_de_atun atun_a_la_parrilla)
		(incompatible crema_de_calabaza paella_mixta)
		(incompatible crema_de_champinones arroz_con_costra)
		(incompatible crema_de_esparragos arroz_a_la_cubana)
		(incompatible crema_de_zanahoria arroz_meloso_de_verduras)
		(incompatible crema_de_aguacate albondigas)
		(incompatible sopa_de_lentejas costillas_a_la_barbacoa)
		(incompatible ensalada_cesar estofado_de_cordero)

		(obligatorio_dia arroz_meloso_de_verduras mie)
		(obligatorio_dia salmon_a_la_plancha lun)
		(obligatorio_dia sopa_de_lentejas vie)

		(dia_siguiente lun mar)
		(dia_siguiente mar mie)
		(dia_siguiente mie jue)
		(dia_siguiente jue vie)
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
