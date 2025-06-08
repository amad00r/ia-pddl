(define (problem menu-semanal-extension-e2)
	(:domain menu_semanal)
	(:objects
		lun mar mie jue vie - dia
		crema sopa ensalada carne arroz pescado - tipo_plato
		sopa_minestrone sopa_de_pollo sopa_de_verduras sopa_de_tomate sopa_de_lentejas ensalada_caprese ensalada_de_quinoa crema_de_zanahoria crema_de_esparragos crema_de_champinones - primero
		albondigas costillas_a_la_barbacoa pollo_asado merluza_en_salsa_verde calamares_a_la_romana atun_a_la_parrilla arroz_con_costra arroz_a_la_cubana arroz_al_horno paella_mixta arroz_meloso_de_verduras - segundo
	)

	(:init
		(es_tipo sopa_minestrone sopa)
		(es_tipo sopa_de_pollo sopa)
		(es_tipo sopa_de_verduras sopa)
		(es_tipo sopa_de_tomate sopa)
		(es_tipo sopa_de_lentejas sopa)
		(es_tipo ensalada_caprese ensalada)
		(es_tipo ensalada_de_quinoa ensalada)
		(es_tipo crema_de_zanahoria crema)
		(es_tipo crema_de_esparragos crema)
		(es_tipo crema_de_champinones crema)

		(es_tipo albondigas carne)
		(es_tipo costillas_a_la_barbacoa carne)
		(es_tipo pollo_asado carne)
		(es_tipo merluza_en_salsa_verde pescado)
		(es_tipo calamares_a_la_romana pescado)
		(es_tipo atun_a_la_parrilla pescado)
		(es_tipo arroz_con_costra arroz)
		(es_tipo arroz_a_la_cubana arroz)
		(es_tipo arroz_al_horno arroz)
		(es_tipo paella_mixta arroz)
		(es_tipo arroz_meloso_de_verduras arroz)

		(incompatible sopa_de_pollo costillas_a_la_barbacoa)
		(incompatible sopa_minestrone calamares_a_la_romana)
		(incompatible sopa_de_tomate atun_a_la_parrilla)
		(incompatible ensalada_caprese arroz_al_horno)
		(incompatible crema_de_champinones arroz_con_costra)
		(incompatible crema_de_esparragos arroz_a_la_cubana)
		(incompatible crema_de_zanahoria arroz_meloso_de_verduras)
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
