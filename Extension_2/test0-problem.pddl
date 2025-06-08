(define (problem menu-semanal-extension-e2)
	(:domain menu_semanal)
	(:objects
		lun mar mie jue vie - dia
		crema ensalada carne sopa pescado arroz - tipo_plato
		sopa_de_verduras sopa_de_lentejas sopa_de_pollo sopa_minestrone ensalada_griega ensalada_de_quinoa ensalada_caprese ensalada_cesar crema_de_aguacate crema_de_zanahoria crema_de_champinones - primero
		albondigas costillas_a_la_barbacoa pollo_asado salmon_a_la_plancha atun_a_la_parrilla bacalao_al_horno merluza_en_salsa_verde calamares_a_la_romana arroz_a_la_cubana arroz_con_costra arroz_meloso_de_verduras paella_mixta - segundo
	)

	(:init
		(es_tipo sopa_de_verduras sopa)
		(es_tipo sopa_de_lentejas sopa)
		(es_tipo sopa_de_pollo sopa)
		(es_tipo sopa_minestrone sopa)
		(es_tipo ensalada_griega ensalada)
		(es_tipo ensalada_de_quinoa ensalada)
		(es_tipo ensalada_caprese ensalada)
		(es_tipo ensalada_cesar ensalada)
		(es_tipo crema_de_aguacate crema)
		(es_tipo crema_de_zanahoria crema)
		(es_tipo crema_de_champinones crema)

		(es_tipo albondigas carne)
		(es_tipo costillas_a_la_barbacoa carne)
		(es_tipo pollo_asado carne)
		(es_tipo salmon_a_la_plancha pescado)
		(es_tipo atun_a_la_parrilla pescado)
		(es_tipo bacalao_al_horno pescado)
		(es_tipo merluza_en_salsa_verde pescado)
		(es_tipo calamares_a_la_romana pescado)
		(es_tipo arroz_a_la_cubana arroz)
		(es_tipo arroz_con_costra arroz)
		(es_tipo arroz_meloso_de_verduras arroz)
		(es_tipo paella_mixta arroz)

		(incompatible sopa_de_pollo costillas_a_la_barbacoa)
		(incompatible sopa_minestrone calamares_a_la_romana)
		(incompatible ensalada_cesar pollo_asado)
		(incompatible ensalada_griega merluza_en_salsa_verde)
		(incompatible ensalada_de_quinoa bacalao_al_horno)
		(incompatible crema_de_champinones arroz_con_costra)
		(incompatible crema_de_zanahoria arroz_meloso_de_verduras)
		(incompatible crema_de_aguacate albondigas)
		(incompatible sopa_de_lentejas costillas_a_la_barbacoa)

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
