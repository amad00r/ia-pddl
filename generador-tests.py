import os
import random

def main():
	ext = input("Selecciona una extensión (0-5): ")
	while (not ext.isdigit()) or int(ext) < 0 or int(ext) > 5:
		ext = input("Introduce un valor correcto (0-5): ")
	
	carpeta = None
	if int(ext) >= 1:
		carpeta = "Extension_" + ext
	else:
		carpeta = "Basico"
	ext = int(ext)
	os.makedirs(carpeta, exist_ok=True)

	n = int(input("Introduce el número de juegos de prueba para generar: "))

	mapa_platos1 = {
		"sopa": ["sopa_de_pollo", "sopa_de_verduras", "sopa_de_lentejas", "sopa_minestrone", "sopa_de_tomate"],
		"ensalada": ["ensalada_cesar", "ensalada_griega", "ensalada_de_quinoa", "ensalada_de_atun", "ensalada_caprese"],
		"crema": ["crema_de_calabaza", "crema_de_champinones", "crema_de_esparragos", "crema_de_zanahoria", "crema_de_aguacate"]
	}
	mapa_platos2 = {
		"carne": ["filete_de_ternera", "pollo_asado", "estofado_de_cordero", "albondigas", "costillas_a_la_barbacoa"],
		"pescado": ["salmon_a_la_plancha", "bacalao_al_horno", "merluza_en_salsa_verde", "atun_a_la_parrilla", "calamares_a_la_romana"],
		"arroz": ["paella_mixta", "arroz_al_horno", "arroz_con_costra", "arroz_a_la_cubana", "arroz_meloso_de_verduras"]
	}
	calorias = {
		'sopa_de_pollo': 285, 'sopa_de_verduras': 228, 'sopa_de_lentejas': 342, 'sopa_minestrone': 304, 'sopa_de_tomate': 266,
		'ensalada_cesar': 247, 'ensalada_griega': 209, 'ensalada_de_quinoa': 323, 'ensalada_de_atun': 361, 'ensalada_caprese': 285,
		'crema_de_calabaza': 304, 'crema_de_champinones': 266, 'crema_de_esparragos': 247, 'crema_de_zanahoria': 228, 'crema_de_aguacate': 342,
		'filete_de_ternera': 1140, 'pollo_asado': 1045, 'estofado_de_cordero': 1235, 'albondigas': 1102, 'costillas_a_la_barbacoa': 1330,
		'salmon_a_la_plancha': 988, 'bacalao_al_horno': 950, 'merluza_en_salsa_verde': 912, 'atun_a_la_parrilla': 1007, 'calamares_a_la_romana': 1140,
		'paella_mixta': 1235, 'arroz_al_horno': 1140, 'arroz_con_costra': 1178, 'arroz_a_la_cubana': 1216, 'arroz_meloso_de_verduras': 1102
	}
	precios = {
		"sopa_de_pollo": 4.5, "sopa_de_verduras": 3.8, "sopa_de_lentejas": 4.0, "sopa_minestrone": 4.2, "sopa_de_tomate": 3.9,
		"ensalada_cesar": 5.0, "ensalada_griega": 4.7, "ensalada_de_quinoa": 5.5, "ensalada_de_atun": 5.8, "ensalada_caprese": 5.3,
		"crema_de_calabaza": 4.9, "crema_de_champinones": 4.6, "crema_de_esparragos": 4.4, "crema_de_zanahoria": 4.2, "crema_de_aguacate": 5.0,
		"filete_de_ternera": 12.0, "pollo_asado": 11.5, "estofado_de_cordero": 13.0, "albondigas": 11.0, "costillas_a_la_barbacoa": 14.0,
		"salmon_a_la_plancha": 13.5, "bacalao_al_horno": 12.5, "merluza_en_salsa_verde": 12.0, "atun_a_la_parrilla": 13.2, "calamares_a_la_romana": 12.8,
		"paella_mixta": 14.0, "arroz_al_horno": 13.0, "arroz_con_costra": 13.5, "arroz_a_la_cubana": 12.8, "arroz_meloso_de_verduras": 12.0
	}

	incompatibilidades = [
		("sopa_de_pollo", "costillas_a_la_barbacoa"),
		("sopa_de_verduras", "estofado_de_cordero"),
		("sopa_de_lentejas", "filete_de_ternera"),
		("sopa_minestrone", "calamares_a_la_romana"),
		("sopa_de_tomate", "atun_a_la_parrilla"),
		("ensalada_cesar", "pollo_asado"),
		("ensalada_griega", "merluza_en_salsa_verde"),
		("ensalada_de_quinoa", "bacalao_al_horno"),
		("ensalada_de_atun", "atun_a_la_parrilla"),
		("ensalada_caprese", "arroz_al_horno"),
		("crema_de_calabaza", "paella_mixta"),
		("crema_de_champinones", "arroz_con_costra"),
		("crema_de_esparragos", "arroz_a_la_cubana"),
		("crema_de_zanahoria", "arroz_meloso_de_verduras"),
		("crema_de_aguacate", "albondigas"),
		("sopa_de_lentejas", "costillas_a_la_barbacoa"),
		("ensalada_cesar", "estofado_de_cordero"),
	]

	dias = ["lun", "mar", "mie", "jue", "vie"]

	for i in range(n):
		filename = f"{carpeta}/test{i}-problem.pddl"
		with open(filename, "w", encoding="utf-8") as f:
			f.write(f"(define (problem menu-semanal-extension-e{ext})\n")
			f.write("\t(:domain menu_semanal)\n")

			f.write("\t(:objects\n")
			f.write("\t\t" + " ".join(dias) + " - dia\n")

			tipos1 = list(mapa_platos1.keys())
			tipos2 = list(mapa_platos2.keys())
			tipos = list(set(tipos1 + tipos2))
			f.write("\t\t" + " ".join(tipos) + " - tipo_plato\n")

			primeros = []
			segundos = []
			platos_seleccionados_primero = {}
			platos_seleccionados_segundo = {}

			for tipo, platos in mapa_platos1.items():
				seleccion = random.sample(platos, random.randint(2, 5))
				platos_seleccionados_primero[tipo] = seleccion
				for plato in seleccion:
					primeros.append(plato)

			for tipo, platos in mapa_platos2.items():
				seleccion = random.sample(platos, random.randint(2, 5))
				platos_seleccionados_segundo[tipo] = seleccion
				for plato in seleccion:
					segundos.append(plato)

			f.write("\t\t" + " ".join(primeros) + " - primero\n")
			f.write("\t\t" + " ".join(segundos) + " - segundo\n")
			f.write("\t)\n\n")

			f.write("\t(:init\n")
			for tipo, platos in platos_seleccionados_primero.items():
				for plato in platos:
					f.write(f"\t\t(es_tipo {plato} {tipo})\n")
					if ext >= 4:
						f.write(f"\t\t(= (calorias {plato}) {calorias[plato]})\n")
					if ext >= 5:
						f.write(f"\t\t(= (precio {plato}) {precios[plato]})\n")
			
			f.write("\n")

			for tipo, platos in platos_seleccionados_segundo.items():
				for plato in platos:
					f.write(f"\t\t(es_tipo {plato} {tipo})\n")
					if ext >= 4:
						f.write(f"\t\t(= (calorias {plato}) {calorias[plato]})\n")
					if ext >= 5:
						f.write(f"\t\t(= (precio {plato}) {precios[plato]})\n")

			f.write("\n")

			for (p1, s1) in incompatibilidades:
				if any(p1 in platos1 for platos1 in platos_seleccionados_primero.values()) and any(s1 in platos2 for platos2 in platos_seleccionados_segundo.values()):
					f.write(f"\t\t(incompatible {p1} {s1})\n")
			f.write("\n")

			if ext >= 3:
				dias_obligatorios = random.sample(dias, 3)
				for dia in dias_obligatorios:
					if random.choice(["p", "s"]) == "p":
						plato = random.choice([plato for tiposSel in platos_seleccionados_primero.values() for plato in tiposSel])
						f.write(f"\t\t(obligatorio_dia {plato} {dia})\n")
					else:
						plato = random.choice([plato for tiposSel in platos_seleccionados_segundo.values() for plato in tiposSel])
						f.write(f"\t\t(obligatorio_dia {plato} {dia})\n")
						
				f.write("\n")


			if ext >= 2:
				for d1, d2 in zip(dias[:-1], dias[1:]):
					f.write(f"\t\t(dia_siguiente {d1} {d2})\n")

			if ext >= 5:
				f.write("\n\t\t(= (precio_total) 0)\n")

			if ext >= 4:
				for dia in dias:
					f.write(f"\t\t(= (calorias_dia {dia}) 0)\n")

			f.write("\t)\n\n")

			f.write("\t(:goal \n\t\t(and\n")
			for dia in dias:
				f.write(f"\t\t\t(dia_completo {dia})\n")
			f.write("\t\t)\n\t)\n")

			if ext >= 5:
				f.write("\t(:metric minimize (precio_total))\n")
			
			f.write(")\n")

	print(f"Generados {n} juegos de prueba en la carpeta '{carpeta}'.")

if __name__ == "__main__":
	main()
