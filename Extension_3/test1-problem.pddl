(define (problem menu-semanal-extension-e3)
	(:domain menu_semanal)
	(:objects
		lun mar mie jue vie - dia
		pescado crema ensalada arroz carne sopa - tipo_plato
		sopa_de_verduras sopa_de_pollo sopa_de_lentejas sopa_minestrone sopa_de_tomate ensalada_de_atun ensalada_cesar ensalada_griega ensalada_de_quinoa crema_de_esparragos crema_de_aguacate crema_de_zanahoria - primero
		costillas_a_la_barbacoa albondigas bacalao_al_horno atun_a_la_parrilla arroz_con_costra arroz_meloso_de_verduras arroz_a_la_cubana paella_mixta arroz_al_horno - segundo
	)

	(:init
		(es_tipo sopa_de_verduras sopa)
		(es_tipo sopa_de_pollo sopa)
		(es_tipo sopa_de_lentejas sopa)
		(es_tipo sopa_minestrone sopa)
		(es_tipo sopa_de_tomate sopa)
		(es_tipo ensalada_de_atun ensalada)
		(es_tipo ensalada_cesar ensalada)
		(es_tipo ensalada_griega ensalada)
		(es_tipo ensalada_de_quinoa ensalada)
		(es_tipo crema_de_esparragos crema)
		(es_tipo crema_de_aguacate crema)
		(es_tipo crema_de_zanahoria crema)

		(es_tipo costillas_a_la_barbacoa carne)
		(es_tipo albondigas carne)
		(es_tipo bacalao_al_horno pescado)
		(es_tipo atun_a_la_parrilla pescado)
		(es_tipo arroz_con_costra arroz)
		(es_tipo arroz_meloso_de_verduras arroz)
		(es_tipo arroz_a_la_cubana arroz)
		(es_tipo paella_mixta arroz)
		(es_tipo arroz_al_horno arroz)

		(incompatible sopa_de_pollo costillas_a_la_barbacoa)
		(incompatible sopa_de_tomate atun_a_la_parrilla)
		(incompatible ensalada_de_quinoa bacalao_al_horno)
		(incompatible ensalada_de_atun atun_a_la_parrilla)
		(incompatible crema_de_esparragos arroz_a_la_cubana)
		(incompatible crema_de_zanahoria arroz_meloso_de_verduras)
		(incompatible crema_de_aguacate albondigas)
		(incompatible sopa_de_lentejas costillas_a_la_barbacoa)

		(obligatorio_dia crema_de_aguacate jue)
		(obligatorio_dia arroz_meloso_de_verduras mar)
		(obligatorio_dia crema_de_zanahoria lun)

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
