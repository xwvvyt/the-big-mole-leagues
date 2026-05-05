extends Node3D

# On fait le lien avec les scènes que tu as créées aux étapes 1 et 2
@export var atome_scene: PackedScene # Glisse Atome.tscn ici dans l'inspecteur
@export var liaison_scene: PackedScene # Glisse Liaison.tscn ici dans l'inspecteur

# TON DICTIONNAIRE (Tu peux le remplir avec tes couleurs)
var mon_dico_atomes = {
	"S": Color.YELLOW,
	"C": Color.BLACK,
	"H": Color.WHITE,
	"O": Color.RED,
	"N": Color.BLUE
}

func clear_molecule():
	for child in get_children():
		if not child is Camera3D:
			child.queue_free()
			
func _ready():
	# Test : Créons une molécule de Sulfure d'Hydrogène (H2S) au démarrage
	#creer_molecule_C4H5N3O(Vector3(0, 0, 0))
	pass

# Fonction pour créer un atome unique proprement
func spawn_atome(symbole: String, pos: Vector3) -> Atome3D:
	if mon_dico_atomes.has(symbole):
		var nouvel_atome = atome_scene.instantiate()
		add_child(nouvel_atome)
		nouvel_atome.global_position = pos
		nouvel_atome.setup(symbole)
		return nouvel_atome
	return null

# Fonction pour créer un bâton entre deux atomes
func spawn_liaison(atome_a: Atome3D, atome_b: Atome3D):
	var nouvelle_liaison = liaison_scene.instantiate()
	add_child(nouvelle_liaison)
	nouvelle_liaison.relier(atome_a.global_position, atome_b.global_position)

# Exemple de construction : H2S
func creer_molecule_H2S(centre: Vector3):
	# 1. Créer le Soufre central
	var s = spawn_atome("S", centre)
	
	# 2. Créer les deux Hydrogènes (placés un peu sur les côtés)
	var h1 = spawn_atome("H", centre + Vector3(1.2, -0.8, 0))
	var h2 = spawn_atome("H", centre + Vector3(-1.2, -0.8, 0))
	
	# 3. Créer les bâtons pour relier le tout
	spawn_liaison(s, h1)
	spawn_liaison(s, h2)
	# ============================================================
# FONCTIONS DE CRÉATION DE MOLÉCULES
# Généré automatiquement depuis formules_valides
# ============================================================

# ----------------------------------------------------------
# H2O — Eau
# ----------------------------------------------------------
func creer_molecule_H2O(centre: Vector3):
	# Oxygène central (géométrie coudée ~104.5°)
	var o  = spawn_atome("O", centre)
	var h1 = spawn_atome("H", centre + Vector3( 0.76,  0.59, 0.0))
	var h2 = spawn_atome("H", centre + Vector3(-0.76,  0.59, 0.0))
	spawn_liaison(o, h1)
	spawn_liaison(o, h2)

# ----------------------------------------------------------
# C5H5N5 — Adénine
# ----------------------------------------------------------
func creer_molecule_C5H5N5(centre: Vector3):
	# Cycle pyrimidique (N1-C2-N3-C4-C5-C6) + cycle imidazole (C4-C5-N7-C8-N9)
	# Positions approximatives dans le plan XZ
	var n1 = spawn_atome("N", centre + Vector3( 0.0,   0.0,  1.4))
	var c2 = spawn_atome("C", centre + Vector3( 1.21,  0.0,  0.7))
	var n3 = spawn_atome("N", centre + Vector3( 1.21,  0.0, -0.7))
	var c4 = spawn_atome("C", centre + Vector3( 0.0,   0.0, -1.4))
	var c5 = spawn_atome("C", centre + Vector3(-1.21,  0.0, -0.7))
	var c6 = spawn_atome("C", centre + Vector3(-1.21,  0.0,  0.7))
	var n7 = spawn_atome("N", centre + Vector3(-2.3,   0.0, -1.4))
	var c8 = spawn_atome("C", centre + Vector3(-1.9,   0.0, -2.6))
	var n9 = spawn_atome("N", centre + Vector3(-0.6,   0.0, -2.6))
	# Hydrogènes
	var h2 = spawn_atome("H", centre + Vector3( 2.1,   0.0,  1.1))
	var h8 = spawn_atome("H", centre + Vector3(-2.6,   0.0, -3.4))
	var ha1 = spawn_atome("H", centre + Vector3( 0.0,   0.0,  2.4))
	var ha2 = spawn_atome("H", centre + Vector3(-0.5,   0.8,  2.1))
	var ha3 = spawn_atome("H", centre + Vector3( 0.5,   0.8,  2.1))
	# Liaisons cycle pyrimidique
	spawn_liaison(n1, c2)
	spawn_liaison(c2, n3)
	spawn_liaison(n3, c4)
	spawn_liaison(c4, c5)
	spawn_liaison(c5, c6)
	spawn_liaison(c6, n1)
	# Liaisons cycle imidazole
	spawn_liaison(c5, n7)
	spawn_liaison(n7, c8)
	spawn_liaison(c8, n9)
	spawn_liaison(n9, c4)
	# Liaisons H
	spawn_liaison(c2, h2)
	spawn_liaison(c8, h8)
	spawn_liaison(n1, ha1)
	spawn_liaison(n1, ha2)
	spawn_liaison(n1, ha3)

# ----------------------------------------------------------
# C5H6N2O2 — Thymine
# ----------------------------------------------------------
func creer_molecule_C5H6N2O2(centre: Vector3):
	# Cycle pyrimidine à 6 membres
	var n1 = spawn_atome("N", centre + Vector3( 0.0,  0.0,  1.4))
	var c2 = spawn_atome("C", centre + Vector3( 1.21, 0.0,  0.7))
	var n3 = spawn_atome("N", centre + Vector3( 1.21, 0.0, -0.7))
	var c4 = spawn_atome("C", centre + Vector3( 0.0,  0.0, -1.4))
	var c5 = spawn_atome("C", centre + Vector3(-1.21, 0.0, -0.7))
	var c6 = spawn_atome("C", centre + Vector3(-1.21, 0.0,  0.7))
	# Oxygènes
	var o2 = spawn_atome("O", centre + Vector3( 2.2,  0.0,  1.2))
	var o4 = spawn_atome("O", centre + Vector3( 0.0,  0.0, -2.6))
	# Méthyle sur C5
	var cm = spawn_atome("C", centre + Vector3(-2.5,  0.0, -1.2))
	# Hydrogènes
	var h1 = spawn_atome("H", centre + Vector3( 0.0,  0.0,  2.4))
	var h3 = spawn_atome("H", centre + Vector3( 2.1,  0.0, -1.1))
	var h6 = spawn_atome("H", centre + Vector3(-2.1,  0.0,  1.4))
	var hm1 = spawn_atome("H", centre + Vector3(-3.1,  0.0, -0.3))
	var hm2 = spawn_atome("H", centre + Vector3(-2.9,  0.0, -2.1))
	var hm3 = spawn_atome("H", centre + Vector3(-2.3,  1.0, -1.5))
	# Liaisons cycle
	spawn_liaison(n1, c2); spawn_liaison(c2, n3); spawn_liaison(n3, c4)
	spawn_liaison(c4, c5); spawn_liaison(c5, c6); spawn_liaison(c6, n1)
	# Liaisons exocycliques
	spawn_liaison(c2, o2); spawn_liaison(c4, o4); spawn_liaison(c5, cm)
	spawn_liaison(n1, h1); spawn_liaison(n3, h3); spawn_liaison(c6, h6)
	spawn_liaison(cm, hm1); spawn_liaison(cm, hm2); spawn_liaison(cm, hm3)

# ----------------------------------------------------------
# C5H5N5O — Guanine
# ----------------------------------------------------------
func creer_molecule_C5H5N5O(centre: Vector3):
	# Bicyclique : pyrimidine + imidazole
	var n1 = spawn_atome("N", centre + Vector3( 0.0,  0.0,  1.4))
	var c2 = spawn_atome("C", centre + Vector3( 1.21, 0.0,  0.7))
	var n3 = spawn_atome("N", centre + Vector3( 1.21, 0.0, -0.7))
	var c4 = spawn_atome("C", centre + Vector3( 0.0,  0.0, -1.4))
	var c5 = spawn_atome("C", centre + Vector3(-1.21, 0.0, -0.7))
	var c6 = spawn_atome("C", centre + Vector3(-1.21, 0.0,  0.7))
	var n7 = spawn_atome("N", centre + Vector3(-2.3,  0.0, -1.4))
	var c8 = spawn_atome("C", centre + Vector3(-1.9,  0.0, -2.6))
	var n9 = spawn_atome("N", centre + Vector3(-0.6,  0.0, -2.6))
	var o6 = spawn_atome("O", centre + Vector3(-2.2,  0.0,  1.5))
	var h1 = spawn_atome("H", centre + Vector3( 0.0,  0.0,  2.4))
	var h8 = spawn_atome("H", centre + Vector3(-2.6,  0.0, -3.4))
	var ha1 = spawn_atome("H", centre + Vector3( 2.1,  0.0,  1.3))
	var ha2 = spawn_atome("H", centre + Vector3( 2.5,  0.0,  1.8))
	var h9 = spawn_atome("H", centre + Vector3(-0.1,  0.0, -3.5))
	# Cycle pyrimidine
	spawn_liaison(n1, c2); spawn_liaison(c2, n3); spawn_liaison(n3, c4)
	spawn_liaison(c4, c5); spawn_liaison(c5, c6); spawn_liaison(c6, n1)
	# Cycle imidazole
	spawn_liaison(c5, n7); spawn_liaison(n7, c8); spawn_liaison(c8, n9); spawn_liaison(n9, c4)
	# Exocycliques
	spawn_liaison(c6, o6)
	spawn_liaison(n1, h1); spawn_liaison(c8, h8)
	spawn_liaison(c2, ha1); spawn_liaison(c2, ha2); spawn_liaison(n9, h9)

# ----------------------------------------------------------
# C4H5N3O — Cytosine
# ----------------------------------------------------------
func creer_molecule_C4H5N3O(centre: Vector3):
	var n1 = spawn_atome("N", centre + Vector3( 0.0,  0.0,  1.4))
	var c2 = spawn_atome("C", centre + Vector3( 1.21, 0.0,  0.7))
	var n3 = spawn_atome("N", centre + Vector3( 1.21, 0.0, -0.7))
	var c4 = spawn_atome("C", centre + Vector3( 0.0,  0.0, -1.4))
	var c5 = spawn_atome("C", centre + Vector3(-1.21, 0.0, -0.7))
	var c6 = spawn_atome("C", centre + Vector3(-1.21, 0.0,  0.7))
	var o2 = spawn_atome("O", centre + Vector3( 2.2,  0.0,  1.2))
	var na = spawn_atome("N", centre + Vector3( 0.0,  0.0, -2.6))
	var h5 = spawn_atome("H", centre + Vector3(-2.1,  0.0, -1.2))
	var h6 = spawn_atome("H", centre + Vector3(-2.1,  0.0,  1.4))
	var h1 = spawn_atome("H", centre + Vector3( 0.0,  0.0,  2.4))
	var ha1 = spawn_atome("H", centre + Vector3( 0.7,  0.0, -3.2))
	var ha2 = spawn_atome("H", centre + Vector3(-0.7, 0.0, -3.2))
	spawn_liaison(n1, c2); spawn_liaison(c2, n3); spawn_liaison(n3, c4)
	spawn_liaison(c4, c5); spawn_liaison(c5, c6); spawn_liaison(c6, n1)
	spawn_liaison(c2, o2); spawn_liaison(c4, na)
	spawn_liaison(c5, h5); spawn_liaison(c6, h6); spawn_liaison(n1, h1)
	spawn_liaison(na, ha1); spawn_liaison(na, ha2)

# ----------------------------------------------------------
# C5H10N2O3 — L-Glutamine
# ----------------------------------------------------------
func creer_molecule_C5H10N2O3(centre: Vector3):
	# Chaîne : NH2-CH(COOH)-CH2-CH2-CO-NH2
	var n   = spawn_atome("N", centre + Vector3(-2.4,  0.6,  0.0))
	var ca  = spawn_atome("C", centre + Vector3(-1.2,  0.0,  0.0))
	var c   = spawn_atome("C", centre + Vector3( 0.0,  0.8,  0.0))
	var o   = spawn_atome("O", centre + Vector3( 0.0,  2.0,  0.0))
	var oh  = spawn_atome("O", centre + Vector3( 1.2,  0.2,  0.0))
	var cb  = spawn_atome("C", centre + Vector3(-1.2, -1.2,  0.5))
	var cg  = spawn_atome("C", centre + Vector3(-1.2, -2.5,  0.0))
	var cd  = spawn_atome("C", centre + Vector3(-1.2, -3.7,  0.5))
	var oe  = spawn_atome("O", centre + Vector3(-1.2, -4.8,  0.0))
	var ne  = spawn_atome("N", centre + Vector3(-1.2, -3.7,  1.9))
	# H sur N terminal
	var hn1 = spawn_atome("H", centre + Vector3(-2.4,  1.6,  0.3))
	var hn2 = spawn_atome("H", centre + Vector3(-3.2,  0.1,  0.3))
	var hn3 = spawn_atome("H", centre + Vector3(-2.4,  0.6, -1.0))
	var hca = spawn_atome("H", centre + Vector3(-1.2,  0.0, -1.1))
	var hoh = spawn_atome("H", centre + Vector3( 2.0,  0.8,  0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-0.3, -1.2,  1.1))
	var hb2 = spawn_atome("H", centre + Vector3(-2.1, -1.2,  1.1))
	var hg1 = spawn_atome("H", centre + Vector3(-0.3, -2.5, -0.6))
	var hg2 = spawn_atome("H", centre + Vector3(-2.1, -2.5, -0.6))
	var hne1 = spawn_atome("H", centre + Vector3(-0.4, -3.7,  2.4))
	var hne2 = spawn_atome("H", centre + Vector3(-2.0, -3.7,  2.4))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, cg); spawn_liaison(cg, cd)
	spawn_liaison(cd, oe); spawn_liaison(cd, ne)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2)
	spawn_liaison(cg, hg1); spawn_liaison(cg, hg2)
	spawn_liaison(ne, hne1); spawn_liaison(ne, hne2)

# ----------------------------------------------------------
# C3H7NO2 — L-Alanine
# ----------------------------------------------------------
func creer_molecule_C3H7NO2(centre: Vector3):
	var n   = spawn_atome("N", centre + Vector3(-1.5,  0.5,  0.0))
	var ca  = spawn_atome("C", centre + Vector3( 0.0,  0.0,  0.0))
	var c   = spawn_atome("C", centre + Vector3( 1.1,  0.9,  0.0))
	var o   = spawn_atome("O", centre + Vector3( 1.0,  2.1,  0.0))
	var oh  = spawn_atome("O", centre + Vector3( 2.3,  0.3,  0.0))
	var cb  = spawn_atome("C", centre + Vector3( 0.0, -1.0,  1.2))
	var hn1 = spawn_atome("H", centre + Vector3(-1.5,  1.5,  0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-2.1, -0.0,  0.6))
	var hn3 = spawn_atome("H", centre + Vector3(-1.9,  0.5, -0.9))
	var hca = spawn_atome("H", centre + Vector3( 0.0,  0.0, -1.1))
	var hoh = spawn_atome("H", centre + Vector3( 3.0,  0.9,  0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 0.0, -0.5,  2.2))
	var hb2 = spawn_atome("H", centre + Vector3( 1.0, -1.6,  1.1))
	var hb3 = spawn_atome("H", centre + Vector3(-0.9, -1.7,  1.1))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2); spawn_liaison(cb, hb3)

# ----------------------------------------------------------
# C3H4O3 — Acide pyruvique
# ----------------------------------------------------------
func creer_molecule_C3H4O3(centre: Vector3):
	# CH3-CO-COOH
	var c1  = spawn_atome("C", centre + Vector3(-2.0, 0.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3(-0.6, 0.0, 0.0))
	var o1  = spawn_atome("O", centre + Vector3(-0.1, 1.1, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.6,-0.9, 0.0))
	var o2  = spawn_atome("O", centre + Vector3( 0.2,-2.0, 0.0))
	var o3  = spawn_atome("O", centre + Vector3( 1.9,-0.6, 0.0))
	var h1  = spawn_atome("H", centre + Vector3(-2.4, 1.0, 0.0))
	var h2  = spawn_atome("H", centre + Vector3(-2.4,-0.5, 0.9))
	var h3  = spawn_atome("H", centre + Vector3(-2.4,-0.5,-0.9))
	var hoh = spawn_atome("H", centre + Vector3( 2.6,-1.3, 0.0))
	spawn_liaison(c1, c2); spawn_liaison(c2, o1); spawn_liaison(c2, c3)
	spawn_liaison(c3, o2); spawn_liaison(c3, o3)
	spawn_liaison(c1, h1); spawn_liaison(c1, h2); spawn_liaison(c1, h3)
	spawn_liaison(o3, hoh)

# ----------------------------------------------------------
# C6H13NO2 — L-Leucine
# ----------------------------------------------------------
func creer_molecule_C6H13NO2(centre: Vector3):
	# NH2-CH(COOH)-CH2-CH(CH3)-CH3
	var n   = spawn_atome("N", centre + Vector3(-2.5,  0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3(-1.2,  0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 0.0,  0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 0.0,  2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 1.2,  0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3(-1.2, -1.3, 0.5))
	var cg  = spawn_atome("C", centre + Vector3(-1.2, -2.5, 0.0))
	var cd1 = spawn_atome("C", centre + Vector3( 0.0, -3.3, 0.5))
	var cd2 = spawn_atome("C", centre + Vector3(-2.5, -3.3, 0.0))
	# NH2
	var hn1 = spawn_atome("H", centre + Vector3(-2.5,  1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-3.1,  0.0, 0.6))
	var hn3 = spawn_atome("H", centre + Vector3(-2.9,  0.5,-0.9))
	var hca = spawn_atome("H", centre + Vector3(-1.2,  0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 1.9,  0.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-0.3, -1.3, 1.1))
	var hb2 = spawn_atome("H", centre + Vector3(-2.1, -1.3, 1.1))
	var hg  = spawn_atome("H", centre + Vector3(-1.2, -2.4,-1.1))
	var hd11 = spawn_atome("H", centre + Vector3( 0.9, -2.8, 0.5))
	var hd12 = spawn_atome("H", centre + Vector3( 0.0, -4.2, 0.0))
	var hd13 = spawn_atome("H", centre + Vector3( 0.0, -3.5, 1.6))
	var hd21 = spawn_atome("H", centre + Vector3(-3.4, -2.8, 0.0))
	var hd22 = spawn_atome("H", centre + Vector3(-2.5, -4.2,-0.5))
	var hd23 = spawn_atome("H", centre + Vector3(-2.5, -3.5, 1.1))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, cg); spawn_liaison(cg, cd1); spawn_liaison(cg, cd2)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh); spawn_liaison(cb, hb1); spawn_liaison(cb, hb2)
	spawn_liaison(cg, hg)
	spawn_liaison(cd1, hd11); spawn_liaison(cd1, hd12); spawn_liaison(cd1, hd13)
	spawn_liaison(cd2, hd21); spawn_liaison(cd2, hd22); spawn_liaison(cd2, hd23)

# ----------------------------------------------------------
# C3H7NO3 — L-Serine
# ----------------------------------------------------------
func creer_molecule_C3H7NO3(centre: Vector3):
	# NH2-CH(COOH)-CH2OH
	var n   = spawn_atome("N", centre + Vector3(-1.5,  0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3( 0.0,  0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 1.1,  0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 1.0,  2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 2.3,  0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3( 0.0, -1.2, 0.5))
	var og  = spawn_atome("O", centre + Vector3( 0.0, -2.4, 0.0))
	var hn1 = spawn_atome("H", centre + Vector3(-1.5,  1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-2.0,  0.1, 0.7))
	var hn3 = spawn_atome("H", centre + Vector3(-1.9,  0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3( 0.0,  0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 3.0,  0.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 1.0, -1.2, 1.0))
	var hb2 = spawn_atome("H", centre + Vector3(-0.9, -1.2, 1.1))
	var hog = spawn_atome("H", centre + Vector3( 0.0, -3.2, 0.6))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, og)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2); spawn_liaison(og, hog)

# ----------------------------------------------------------
# C6H14N4O2 — L-Arginine
# ----------------------------------------------------------
func creer_molecule_C6H14N4O2(centre: Vector3):
	var n   = spawn_atome("N", centre + Vector3(-2.5,  0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3(-1.2,  0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 0.0,  0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 0.0,  2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 1.2,  0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3(-1.2, -1.3, 0.5))
	var cg  = spawn_atome("C", centre + Vector3(-1.2, -2.6, 0.0))
	var cd  = spawn_atome("C", centre + Vector3(-1.2, -3.8, 0.5))
	var ne  = spawn_atome("N", centre + Vector3(-1.2, -5.0, 0.0))
	var cz  = spawn_atome("C", centre + Vector3(-1.2, -6.2, 0.5))
	var nh1 = spawn_atome("N", centre + Vector3(-1.2, -7.3, 0.0))
	var nh2 = spawn_atome("N", centre + Vector3(-1.2, -6.2, 1.9))
	# Hydrogènes (sélection)
	var hn1 = spawn_atome("H", centre + Vector3(-2.5,  1.5, 0.2))
	var hn2a = spawn_atome("H", centre + Vector3(-3.1,  0.0, 0.6))
	var hn3 = spawn_atome("H", centre + Vector3(-2.9,  0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3(-1.2,  0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 1.9,  0.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-0.3, -1.3, 1.1))
	var hb2 = spawn_atome("H", centre + Vector3(-2.1, -1.3, 1.1))
	var hg1 = spawn_atome("H", centre + Vector3(-0.3, -2.6,-0.6))
	var hg2 = spawn_atome("H", centre + Vector3(-2.1, -2.6,-0.6))
	var hd1 = spawn_atome("H", centre + Vector3(-0.3, -3.8, 1.1))
	var hd2 = spawn_atome("H", centre + Vector3(-2.1, -3.8, 1.1))
	var hne = spawn_atome("H", centre + Vector3(-1.2, -5.0,-1.0))
	var hnh11 = spawn_atome("H", centre + Vector3(-0.4, -7.9, 0.0))
	var hnh12 = spawn_atome("H", centre + Vector3(-2.0, -7.9, 0.0))
	var hnh21 = spawn_atome("H", centre + Vector3(-0.4, -6.7, 2.4))
	var hnh22 = spawn_atome("H", centre + Vector3(-2.0, -6.7, 2.4))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, cg); spawn_liaison(cg, cd)
	spawn_liaison(cd, ne); spawn_liaison(ne, cz); spawn_liaison(cz, nh1); spawn_liaison(cz, nh2)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2a); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2)
	spawn_liaison(cg, hg1); spawn_liaison(cg, hg2)
	spawn_liaison(cd, hd1); spawn_liaison(cd, hd2)
	spawn_liaison(ne, hne)
	spawn_liaison(nh1, hnh11); spawn_liaison(nh1, hnh12)
	spawn_liaison(nh2, hnh21); spawn_liaison(nh2, hnh22)

# ----------------------------------------------------------
# C6H14N2O2 — L-Lysine
# ----------------------------------------------------------
func creer_molecule_C6H14N2O2(centre: Vector3):
	# NH2-CH(COOH)-(CH2)4-NH2
	var n   = spawn_atome("N", centre + Vector3(-2.5,  0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3(-1.2,  0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 0.0,  0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 0.0,  2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 1.2,  0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3(-1.2, -1.3, 0.5))
	var cg  = spawn_atome("C", centre + Vector3(-1.2, -2.6, 0.0))
	var cd  = spawn_atome("C", centre + Vector3(-1.2, -3.8, 0.5))
	var ce  = spawn_atome("C", centre + Vector3(-1.2, -5.1, 0.0))
	var nz  = spawn_atome("N", centre + Vector3(-1.2, -6.3, 0.5))
	var hn1 = spawn_atome("H", centre + Vector3(-2.5,  1.5, 0.2))
	var hn2a = spawn_atome("H", centre + Vector3(-3.1, 0.0, 0.6))
	var hn3 = spawn_atome("H", centre + Vector3(-2.9,  0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3(-1.2,  0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 1.9,  0.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-0.3,-1.3, 1.1))
	var hb2 = spawn_atome("H", centre + Vector3(-2.1,-1.3, 1.1))
	var hg1 = spawn_atome("H", centre + Vector3(-0.3,-2.6,-0.6))
	var hg2 = spawn_atome("H", centre + Vector3(-2.1,-2.6,-0.6))
	var hd1 = spawn_atome("H", centre + Vector3(-0.3,-3.8, 1.1))
	var hd2 = spawn_atome("H", centre + Vector3(-2.1,-3.8, 1.1))
	var he1 = spawn_atome("H", centre + Vector3(-0.3,-5.1,-0.6))
	var he2 = spawn_atome("H", centre + Vector3(-2.1,-5.1,-0.6))
	var hz1 = spawn_atome("H", centre + Vector3(-0.4,-6.9, 0.5))
	var hz2 = spawn_atome("H", centre + Vector3(-2.0,-6.9, 0.5))
	var hz3 = spawn_atome("H", centre + Vector3(-1.2,-6.3,-0.5))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, cg); spawn_liaison(cg, cd)
	spawn_liaison(cd, ce); spawn_liaison(ce, nz)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2a); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2)
	spawn_liaison(cg, hg1); spawn_liaison(cg, hg2)
	spawn_liaison(cd, hd1); spawn_liaison(cd, hd2)
	spawn_liaison(ce, he1); spawn_liaison(ce, he2)
	spawn_liaison(nz, hz1); spawn_liaison(nz, hz2); spawn_liaison(nz, hz3)

# ----------------------------------------------------------
# C4H9NO3 — L-Threonine
# ----------------------------------------------------------
func creer_molecule_C4H9NO3(centre: Vector3):
	# NH2-CH(COOH)-CH(OH)-CH3
	var n   = spawn_atome("N", centre + Vector3(-1.5, 0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 1.1, 0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 1.0, 2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 2.3, 0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3( 0.0,-1.2, 0.5))
	var og1 = spawn_atome("O", centre + Vector3( 0.0,-2.4, 0.0))
	var cg2 = spawn_atome("C", centre + Vector3( 1.3,-1.2, 1.2))
	var hn1 = spawn_atome("H", centre + Vector3(-1.5, 1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-2.0, 0.1, 0.7))
	var hn3 = spawn_atome("H", centre + Vector3(-1.9, 0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3( 0.0, 0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 3.0, 0.9, 0.0))
	var hcb = spawn_atome("H", centre + Vector3(-0.9,-1.2, 1.1))
	var hog = spawn_atome("H", centre + Vector3( 0.0,-3.2, 0.6))
	var hg21 = spawn_atome("H", centre + Vector3( 2.2,-1.2, 0.6))
	var hg22 = spawn_atome("H", centre + Vector3( 1.3,-0.4, 1.9))
	var hg23 = spawn_atome("H", centre + Vector3( 1.3,-2.1, 1.8))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, og1); spawn_liaison(cb, cg2)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh); spawn_liaison(cb, hcb)
	spawn_liaison(og1, hog)
	spawn_liaison(cg2, hg21); spawn_liaison(cg2, hg22); spawn_liaison(cg2, hg23)

# ----------------------------------------------------------
# C4H8N2O3 — L-Asparagine
# ----------------------------------------------------------
func creer_molecule_C4H8N2O3(centre: Vector3):
	# NH2-CH(COOH)-CH2-CO-NH2
	var n   = spawn_atome("N", centre + Vector3(-1.5, 0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 1.1, 0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 1.0, 2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 2.3, 0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3( 0.0,-1.3, 0.5))
	var cg  = spawn_atome("C", centre + Vector3( 0.0,-2.6, 0.0))
	var od  = spawn_atome("O", centre + Vector3( 0.0,-3.7, 0.5))
	var nd  = spawn_atome("N", centre + Vector3( 0.0,-2.6,-1.3))
	var hn1 = spawn_atome("H", centre + Vector3(-1.5, 1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-2.0, 0.1, 0.7))
	var hn3 = spawn_atome("H", centre + Vector3(-1.9, 0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3( 0.0, 0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 3.0, 0.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 1.0,-1.3, 1.0))
	var hb2 = spawn_atome("H", centre + Vector3(-0.9,-1.3, 1.1))
	var hnd1 = spawn_atome("H", centre + Vector3( 0.7,-2.0,-1.7))
	var hnd2 = spawn_atome("H", centre + Vector3(-0.7,-2.0,-1.7))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, cg); spawn_liaison(cg, od); spawn_liaison(cg, nd)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2)
	spawn_liaison(nd, hnd1); spawn_liaison(nd, hnd2)

# ----------------------------------------------------------
# C2H5NO2 — Glycine
# ----------------------------------------------------------
func creer_molecule_C2H5NO2(centre: Vector3):
	# NH2-CH2-COOH
	var n   = spawn_atome("N", centre + Vector3(-1.5, 0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 1.2, 0.8, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 1.1, 2.0, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 2.4, 0.2, 0.0))
	var hn1 = spawn_atome("H", centre + Vector3(-1.5, 1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-2.0, 0.1, 0.7))
	var hn3 = spawn_atome("H", centre + Vector3(-1.9, 0.4,-0.9))
	var ha1 = spawn_atome("H", centre + Vector3( 0.0, 0.0,-1.1))
	var ha2 = spawn_atome("H", centre + Vector3( 0.0,-1.1, 0.4))
	var hoh = spawn_atome("H", centre + Vector3( 3.1, 0.8, 0.0))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, ha1); spawn_liaison(ca, ha2); spawn_liaison(oh, hoh)

# ----------------------------------------------------------
# C5H11NO2S — L-Méthionine
# ----------------------------------------------------------
func creer_molecule_C5H11NO2S(centre: Vector3):
	# NH2-CH(COOH)-CH2-CH2-S-CH3
	var n   = spawn_atome("N", centre + Vector3(-2.5, 0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3(-1.2, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 0.0, 0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 0.0, 2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 1.2, 0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3(-1.2,-1.3, 0.5))
	var cg  = spawn_atome("C", centre + Vector3(-1.2,-2.6, 0.0))
	var sd  = spawn_atome("S", centre + Vector3(-1.2,-4.1, 0.8))
	var ce  = spawn_atome("C", centre + Vector3(-1.2,-5.4, 0.0))
	var hn1 = spawn_atome("H", centre + Vector3(-2.5, 1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-3.1, 0.0, 0.6))
	var hn3 = spawn_atome("H", centre + Vector3(-2.9, 0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3(-1.2, 0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 1.9, 0.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-0.3,-1.3, 1.1))
	var hb2 = spawn_atome("H", centre + Vector3(-2.1,-1.3, 1.1))
	var hg1 = spawn_atome("H", centre + Vector3(-0.3,-2.6,-0.6))
	var hg2 = spawn_atome("H", centre + Vector3(-2.1,-2.6,-0.6))
	var he1 = spawn_atome("H", centre + Vector3(-0.3,-5.4,-0.6))
	var he2 = spawn_atome("H", centre + Vector3(-2.1,-5.4,-0.6))
	var he3 = spawn_atome("H", centre + Vector3(-1.2,-6.3, 0.6))
	spawn_liaison(n, ca); spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh)
	spawn_liaison(ca, cb); spawn_liaison(cb, cg); spawn_liaison(cg, sd); spawn_liaison(sd, ce)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3)
	spawn_liaison(ca, hca); spawn_liaison(oh, hoh)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2)
	spawn_liaison(cg, hg1); spawn_liaison(cg, hg2)
	spawn_liaison(ce, he1); spawn_liaison(ce, he2); spawn_liaison(ce, he3)

# ----------------------------------------------------------
# C11H12N2O2 — L-Tryptophane
# ----------------------------------------------------------
func creer_molecule_C11H12N2O2(centre: Vector3):
	# Indole + chaîne amino-acide
	# Cycle benzène fusionné avec pyrrole
	var c1  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3( 1.4, 0.0, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 2.1, 1.2, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 1.4, 2.4, 0.0))
	var c5  = spawn_atome("C", centre + Vector3( 0.0, 2.4, 0.0))
	var c6  = spawn_atome("C", centre + Vector3(-0.7, 1.2, 0.0))
	var c7  = spawn_atome("C", centre + Vector3(-0.7, 3.6, 0.0))
	var c8  = spawn_atome("C", centre + Vector3( 0.7, 4.4, 0.0))
	var n1  = spawn_atome("N", centre + Vector3( 1.8, 3.6, 0.0))
	# Chaîne alanyle
	var cb  = spawn_atome("C", centre + Vector3( 3.5, 1.2, 0.0))
	var ca  = spawn_atome("C", centre + Vector3( 4.2, 0.0, 0.0))
	var n   = spawn_atome("N", centre + Vector3( 5.6, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 3.5,-1.2, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 3.5,-2.4, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 2.2,-0.6, 0.0))
	# Hydrogènes (simplifiés)
	var h2  = spawn_atome("H", centre + Vector3( 2.0,-0.9, 0.0))
	var h5  = spawn_atome("H", centre + Vector3(-0.5, 3.6, 0.9))
	var h6  = spawn_atome("H", centre + Vector3(-1.8, 1.2, 0.0))
	var h7  = spawn_atome("H", centre + Vector3(-1.8, 3.8, 0.0))
	var h8  = spawn_atome("H", centre + Vector3( 0.7, 5.5, 0.0))
	var hn1 = spawn_atome("H", centre + Vector3( 2.8, 3.8, 0.0))
	var hca = spawn_atome("H", centre + Vector3( 4.2, 0.0,-1.1))
	var hna1 = spawn_atome("H", centre + Vector3( 6.1, 0.9, 0.0))
	var hna2 = spawn_atome("H", centre + Vector3( 6.1,-0.9, 0.0))
	var hna3 = spawn_atome("H", centre + Vector3( 5.7, 0.0, 1.0))
	var hoh = spawn_atome("H", centre + Vector3( 1.5,-1.3, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 3.5, 1.8, 0.9))
	var hb2 = spawn_atome("H", centre + Vector3( 3.5, 1.8,-0.9))
	# Liaisons cycle indole
	spawn_liaison(c1, c2); spawn_liaison(c2, c3); spawn_liaison(c3, c4)
	spawn_liaison(c4, c5); spawn_liaison(c5, c6); spawn_liaison(c6, c1)
	spawn_liaison(c5, c7); spawn_liaison(c7, c8); spawn_liaison(c8, n1); spawn_liaison(n1, c4)
	# Liaison chaîne
	spawn_liaison(c3, cb); spawn_liaison(cb, ca)
	spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh); spawn_liaison(ca, n)
	# H
	spawn_liaison(c2, h2); spawn_liaison(c6, h6); spawn_liaison(c7, h7)
	spawn_liaison(c8, h8); spawn_liaison(n1, hn1); spawn_liaison(ca, hca)
	spawn_liaison(n, hna1); spawn_liaison(n, hna2); spawn_liaison(n, hna3)
	spawn_liaison(oh, hoh); spawn_liaison(cb, hb1); spawn_liaison(cb, hb2)

# ----------------------------------------------------------
# C6H9N3O2 — L-Histidine
# ----------------------------------------------------------
func creer_molecule_C6H9N3O2(centre: Vector3):
	# Cycle imidazole + chaîne
	var nd1 = spawn_atome("N", centre + Vector3( 0.0, 0.0, 0.0))
	var cd2 = spawn_atome("C", centre + Vector3( 1.2, 0.0,-0.8))
	var ce1 = spawn_atome("C", centre + Vector3(-0.4, 0.0, 1.2))
	var ne2 = spawn_atome("N", centre + Vector3( 0.8, 0.0, 2.0))
	var cg  = spawn_atome("C", centre + Vector3( 2.0, 0.0, 1.2))
	var cb  = spawn_atome("C", centre + Vector3( 3.3, 0.0, 0.5))
	var ca  = spawn_atome("C", centre + Vector3( 4.4, 0.0, 1.4))
	var n   = spawn_atome("N", centre + Vector3( 5.7, 0.0, 0.8))
	var c   = spawn_atome("C", centre + Vector3( 4.2, 0.0, 2.8))
	var o   = spawn_atome("O", centre + Vector3( 3.2, 0.0, 3.5))
	var oh  = spawn_atome("O", centre + Vector3( 5.4, 0.0, 3.4))
	var hd1 = spawn_atome("H", centre + Vector3(-0.9, 0.0,-0.5))
	var hd2 = spawn_atome("H", centre + Vector3( 1.4, 0.0,-1.8))
	var he1 = spawn_atome("H", centre + Vector3(-1.4, 0.0, 1.6))
	var hb1 = spawn_atome("H", centre + Vector3( 3.3, 0.9,-0.1))
	var hb2 = spawn_atome("H", centre + Vector3( 3.3,-0.9,-0.1))
	var hca = spawn_atome("H", centre + Vector3( 4.4, 1.0, 2.0))
	var hn1 = spawn_atome("H", centre + Vector3( 5.8, 0.0,-0.2))
	var hn2 = spawn_atome("H", centre + Vector3( 6.4, 0.8, 1.1))
	var hn3 = spawn_atome("H", centre + Vector3( 6.0,-0.8, 1.1))
	var hoh = spawn_atome("H", centre + Vector3( 6.3, 0.0, 3.0))
	spawn_liaison(nd1, cd2); spawn_liaison(cd2, cg); spawn_liaison(cg, ne2)
	spawn_liaison(ne2, ce1); spawn_liaison(ce1, nd1)
	spawn_liaison(cg, cb); spawn_liaison(cb, ca)
	spawn_liaison(ca, c); spawn_liaison(c, o); spawn_liaison(c, oh); spawn_liaison(ca, n)
	spawn_liaison(nd1, hd1); spawn_liaison(cd2, hd2); spawn_liaison(ce1, he1)
	spawn_liaison(cb, hb1); spawn_liaison(cb, hb2); spawn_liaison(ca, hca)
	spawn_liaison(n, hn1); spawn_liaison(n, hn2); spawn_liaison(n, hn3); spawn_liaison(oh, hoh)

# ----------------------------------------------------------
# C9H11NO2 — L-Phenylalanine
# ----------------------------------------------------------
func creer_molecule_C9H11NO2(centre: Vector3):
	# Benzène + chaîne
	var c1  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3( 1.2, 0.7, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 2.4, 0.0, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 2.4,-1.4, 0.0))
	var c5  = spawn_atome("C", centre + Vector3( 1.2,-2.1, 0.0))
	var c6  = spawn_atome("C", centre + Vector3( 0.0,-1.4, 0.0))
	var cb  = spawn_atome("C", centre + Vector3(-1.4, 0.7, 0.0))
	var ca  = spawn_atome("C", centre + Vector3(-2.5, 0.0, 0.0))
	var n   = spawn_atome("N", centre + Vector3(-3.7, 0.7, 0.0))
	var c   = spawn_atome("C", centre + Vector3(-2.5,-1.4, 0.0))
	var o   = spawn_atome("O", centre + Vector3(-1.4,-2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3(-3.7,-2.1, 0.0))
	var h2  = spawn_atome("H", centre + Vector3( 1.2, 1.8, 0.0))
	var h3  = spawn_atome("H", centre + Vector3( 3.4, 0.5, 0.0))
	var h4  = spawn_atome("H", centre + Vector3( 3.4,-1.9, 0.0))
	var h5  = spawn_atome("H", centre + Vector3( 1.2,-3.2, 0.0))
	var h6  = spawn_atome("H", centre + Vector3(-0.9,-1.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-1.4, 1.3, 0.9))
	var hb2 = spawn_atome("H", centre + Vector3(-1.4, 1.3,-0.9))
	var hca = spawn_atome("H", centre + Vector3(-2.5, 0.0,-1.1))
	var hn1 = spawn_atome("H", centre + Vector3(-3.7, 1.7, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-4.4, 0.2, 0.5))
	var hn3 = spawn_atome("H", centre + Vector3(-4.0, 0.7,-0.9))
	var hoh = spawn_atome("H", centre + Vector3(-4.4,-1.5, 0.0))
	spawn_liaison(c1,c2); spawn_liaison(c2,c3); spawn_liaison(c3,c4)
	spawn_liaison(c4,c5); spawn_liaison(c5,c6); spawn_liaison(c6,c1)
	spawn_liaison(c1,cb); spawn_liaison(cb,ca)
	spawn_liaison(ca,c); spawn_liaison(c,o); spawn_liaison(c,oh); spawn_liaison(ca,n)
	spawn_liaison(c2,h2); spawn_liaison(c3,h3); spawn_liaison(c4,h4)
	spawn_liaison(c5,h5); spawn_liaison(c6,h6)
	spawn_liaison(cb,hb1); spawn_liaison(cb,hb2); spawn_liaison(ca,hca)
	spawn_liaison(n,hn1); spawn_liaison(n,hn2); spawn_liaison(n,hn3); spawn_liaison(oh,hoh)

# ----------------------------------------------------------
# C9H11NO3 — L-Tyrosine
# ----------------------------------------------------------
func creer_molecule_C9H11NO3(centre: Vector3):
	# Phénylalanine + OH sur para du benzène
	var c1  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3( 1.2, 0.7, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 2.4, 0.0, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 2.4,-1.4, 0.0))
	var c5  = spawn_atome("C", centre + Vector3( 1.2,-2.1, 0.0))
	var c6  = spawn_atome("C", centre + Vector3( 0.0,-1.4, 0.0))
	var op  = spawn_atome("O", centre + Vector3( 3.6,-2.1, 0.0))  # OH para
	var cb  = spawn_atome("C", centre + Vector3(-1.4, 0.7, 0.0))
	var ca  = spawn_atome("C", centre + Vector3(-2.5, 0.0, 0.0))
	var n   = spawn_atome("N", centre + Vector3(-3.7, 0.7, 0.0))
	var c   = spawn_atome("C", centre + Vector3(-2.5,-1.4, 0.0))
	var o   = spawn_atome("O", centre + Vector3(-1.4,-2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3(-3.7,-2.1, 0.0))
	var hop = spawn_atome("H", centre + Vector3( 4.4,-1.6, 0.0))
	var h2  = spawn_atome("H", centre + Vector3( 1.2, 1.8, 0.0))
	var h3  = spawn_atome("H", centre + Vector3( 3.4, 0.5, 0.0))
	var h5  = spawn_atome("H", centre + Vector3( 1.2,-3.2, 0.0))
	var h6  = spawn_atome("H", centre + Vector3(-0.9,-1.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-1.4, 1.3, 0.9))
	var hb2 = spawn_atome("H", centre + Vector3(-1.4, 1.3,-0.9))
	var hca = spawn_atome("H", centre + Vector3(-2.5, 0.0,-1.1))
	var hn1 = spawn_atome("H", centre + Vector3(-3.7, 1.7, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-4.4, 0.2, 0.5))
	var hn3 = spawn_atome("H", centre + Vector3(-4.0, 0.7,-0.9))
	var hoh = spawn_atome("H", centre + Vector3(-4.4,-1.5, 0.0))
	spawn_liaison(c1,c2); spawn_liaison(c2,c3); spawn_liaison(c3,c4)
	spawn_liaison(c4,c5); spawn_liaison(c5,c6); spawn_liaison(c6,c1)
	spawn_liaison(c4,op); spawn_liaison(c1,cb); spawn_liaison(cb,ca)
	spawn_liaison(ca,c); spawn_liaison(c,o); spawn_liaison(c,oh); spawn_liaison(ca,n)
	spawn_liaison(op,hop); spawn_liaison(c2,h2); spawn_liaison(c3,h3)
	spawn_liaison(c5,h5); spawn_liaison(c6,h6)
	spawn_liaison(cb,hb1); spawn_liaison(cb,hb2); spawn_liaison(ca,hca)
	spawn_liaison(n,hn1); spawn_liaison(n,hn2); spawn_liaison(n,hn3); spawn_liaison(oh,hoh)

# ----------------------------------------------------------
# C3H7NO2S — L-Cystéine
# ----------------------------------------------------------
func creer_molecule_C3H7NO2S(centre: Vector3):
	# NH2-CH(COOH)-CH2-SH
	var n   = spawn_atome("N", centre + Vector3(-1.5, 0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 1.1, 0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 1.0, 2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 2.3, 0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3( 0.0,-1.3, 0.5))
	var sg  = spawn_atome("S", centre + Vector3( 0.0,-2.9, 0.0))
	var hn1 = spawn_atome("H", centre + Vector3(-1.5, 1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-2.0, 0.1, 0.7))
	var hn3 = spawn_atome("H", centre + Vector3(-1.9, 0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3( 0.0, 0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 3.0, 0.9, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 1.0,-1.3, 1.0))
	var hb2 = spawn_atome("H", centre + Vector3(-0.9,-1.3, 1.1))
	var hsg = spawn_atome("H", centre + Vector3( 0.0,-3.8, 0.8))
	spawn_liaison(n,ca); spawn_liaison(ca,c); spawn_liaison(c,o); spawn_liaison(c,oh)
	spawn_liaison(ca,cb); spawn_liaison(cb,sg)
	spawn_liaison(n,hn1); spawn_liaison(n,hn2); spawn_liaison(n,hn3)
	spawn_liaison(ca,hca); spawn_liaison(oh,hoh)
	spawn_liaison(cb,hb1); spawn_liaison(cb,hb2); spawn_liaison(sg,hsg)

# ----------------------------------------------------------
# C6H13NO2 (isoleucine) — L-Isoleucine
# ----------------------------------------------------------
#func creer_molecule_C6H13NO2_isoleucine(centre: Vector3):
	## NH2-CH(COOH)-CH(CH3)-CH2-CH3
	#var n   = spawn_atome("N", centre + Vector3(-2.5, 0.5, 0.0))
	#var ca  = spawn_atome("C", centre + Vector3(-1.2, 0.0, 0.0))
	#var c   = spawn_atome("C", centre + Vector3( 0.0, 0.9, 0.0))
	#var o   = spawn_atome("O", centre + Vector3( 0.0, 2.1, 0.0))
	#var oh  = spawn_atome("O", centre + Vector3( 1.2, 0.3, 0.0))
	#var cb  = spawn_atome("C", centre + Vector3(-1.2,-1.3, 0.5))
	#var cg1 = spawn_atome("C", centre + Vector3(-1.2,-2.5, 0.0))
	#var cg2 = spawn_atome("C", centre + Vector3(-2.5,-1.3, 1.2))  # méthyle
	#var cd1 = spawn_atome("C", centre + Vector3(-1.2,-3.8, 0.5))
	#var hn1 = spawn_atome("H", centre + Vector3(-2.5, 1.5, 0.2))
	#var hn2 = spawn_atome("H", centre + Vector3(-3.1, 0.0, 0.6))
	#var hn3 = spawn_atome("H", centre + Vector3(-2.9, 0.4,-0.9))
	#var hca = spawn_atome("H", centre + Vector3(-1.2, 0.0,-1.1))
	#var hoh = spawn_atome("H", centre + Vector3( 1.9, 0.9, 0.0))
	#var hcb = spawn_atome("H", centre + Vector3(-0.3,-1.3, 1.1))
	#var hg11 = spawn_atome("H", centre + Vector3(-0.3,-2.5,-0.6))
	#var hg12 = spawn_atome("H", centre + Vector3(-2.1,-2.5,-0.6))
	#var hg21 = spawn_atome("H", centre + Vector3(-3.4,-1.3, 0.6))
	#var hg22 = spawn_atome("H", centre + Vector3(-2.5,-0.4, 1.8))
	#var hg23 = spawn_atome("H", centre + Vector3(-2.5,-2.1, 1.8))
	#var hd11 = spawn_atome("H", centre + Vector3(-0.3,-3.8, 1.1))
	#var hd12 = spawn_atome("H", centre + Vector3(-2.1,-3.8, 1.1))
	#var hd13 = spawn_atome("H", centre + Vector3(-1.2,-4.7, 0.0))
	#spawn_liaison(n,ca); spawn_liaison(ca,c); spawn_liaison(c,o); spawn_liaison(c,oh)
	#spawn_liaison(ca,cb); spawn_liaison(cb,cg1); spawn_liaison(cb,cg2); spawn_liaison(cg1,cd1)
	#spawn_liaison(n,hn1); spawn_liaison(n,hn2); spawn_liaison(n,hn3)
	#spawn_liaison(ca,hca); spawn_liaison(oh,hoh); spawn_liaison(cb,hcb)
	#spawn_liaison(cg1,hg11); spawn_liaison(cg1,hg12)
	#spawn_liaison(cg2,hg21); spawn_liaison(cg2,hg22); spawn_liaison(cg2,hg23)
	#spawn_liaison(cd1,hd11); spawn_liaison(cd1,hd12); spawn_liaison(cd1,hd13)

# ----------------------------------------------------------
# C5H9NO2 — L-Proline
# ----------------------------------------------------------
func creer_molecule_C5H9NO2(centre: Vector3):
	# Cycle pyrrolidine : N-Ca-Cb-Cg-Cd-N
	var n   = spawn_atome("N", centre + Vector3( 0.0, 0.0, 0.0))
	var ca  = spawn_atome("C", centre + Vector3( 1.5, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 2.2, 1.3, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 1.5, 2.4, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 3.5, 1.4, 0.0))
	var cb  = spawn_atome("C", centre + Vector3( 2.0,-1.2, 0.0))
	var cg  = spawn_atome("C", centre + Vector3( 1.2,-2.4, 0.0))
	var cd  = spawn_atome("C", centre + Vector3(-0.2,-2.0, 0.0))
	var hn  = spawn_atome("H", centre + Vector3(-0.4, 0.8, 0.0))
	var hca = spawn_atome("H", centre + Vector3( 1.5, 0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 4.1, 0.7, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 3.1,-1.1, 0.0))
	var hb2 = spawn_atome("H", centre + Vector3( 1.9,-1.2, 1.1))
	var hg1 = spawn_atome("H", centre + Vector3( 1.5,-3.4, 0.0))
	var hg2 = spawn_atome("H", centre + Vector3( 1.2,-2.4, 1.1))
	var hd1 = spawn_atome("H", centre + Vector3(-0.8,-2.9, 0.0))
	var hd2 = spawn_atome("H", centre + Vector3(-0.6,-1.5,-0.9))
	spawn_liaison(n,ca); spawn_liaison(ca,c); spawn_liaison(c,o); spawn_liaison(c,oh)
	spawn_liaison(ca,cb); spawn_liaison(cb,cg); spawn_liaison(cg,cd); spawn_liaison(cd,n)
	spawn_liaison(n,hn); spawn_liaison(ca,hca); spawn_liaison(oh,hoh)
	spawn_liaison(cb,hb1); spawn_liaison(cb,hb2)
	spawn_liaison(cg,hg1); spawn_liaison(cg,hg2)
	spawn_liaison(cd,hd1); spawn_liaison(cd,hd2)

# ----------------------------------------------------------
# C5H11NO2 — L-Valine
# ----------------------------------------------------------
func creer_molecule_C5H11NO2(centre: Vector3):
	# NH2-CH(COOH)-CH(CH3)2
	var n   = spawn_atome("N", centre + Vector3(-2.5, 0.5, 0.0))
	var ca  = spawn_atome("C", centre + Vector3(-1.2, 0.0, 0.0))
	var c   = spawn_atome("C", centre + Vector3( 0.0, 0.9, 0.0))
	var o   = spawn_atome("O", centre + Vector3( 0.0, 2.1, 0.0))
	var oh  = spawn_atome("O", centre + Vector3( 1.2, 0.3, 0.0))
	var cb  = spawn_atome("C", centre + Vector3(-1.2,-1.3, 0.5))
	var cg1 = spawn_atome("C", centre + Vector3(-1.2,-2.5, 1.3))
	var cg2 = spawn_atome("C", centre + Vector3(-2.5,-1.3,-0.3))
	var hn1 = spawn_atome("H", centre + Vector3(-2.5, 1.5, 0.2))
	var hn2 = spawn_atome("H", centre + Vector3(-3.1, 0.0, 0.6))
	var hn3 = spawn_atome("H", centre + Vector3(-2.9, 0.4,-0.9))
	var hca = spawn_atome("H", centre + Vector3(-1.2, 0.0,-1.1))
	var hoh = spawn_atome("H", centre + Vector3( 1.9, 0.9, 0.0))
	var hcb = spawn_atome("H", centre + Vector3(-0.3,-1.3, 1.1))
	var hg11 = spawn_atome("H", centre + Vector3(-0.3,-2.5, 1.9))
	var hg12 = spawn_atome("H", centre + Vector3(-2.1,-2.5, 1.9))
	var hg13 = spawn_atome("H", centre + Vector3(-1.2,-3.4, 0.7))
	var hg21 = spawn_atome("H", centre + Vector3(-3.4,-1.3, 0.3))
	var hg22 = spawn_atome("H", centre + Vector3(-2.5,-0.4,-0.9))
	var hg23 = spawn_atome("H", centre + Vector3(-2.5,-2.2,-0.9))
	spawn_liaison(n,ca); spawn_liaison(ca,c); spawn_liaison(c,o); spawn_liaison(c,oh)
	spawn_liaison(ca,cb); spawn_liaison(cb,cg1); spawn_liaison(cb,cg2)
	spawn_liaison(n,hn1); spawn_liaison(n,hn2); spawn_liaison(n,hn3)
	spawn_liaison(ca,hca); spawn_liaison(oh,hoh); spawn_liaison(cb,hcb)
	spawn_liaison(cg1,hg11); spawn_liaison(cg1,hg12); spawn_liaison(cg1,hg13)
	spawn_liaison(cg2,hg21); spawn_liaison(cg2,hg22); spawn_liaison(cg2,hg23)

# ----------------------------------------------------------
# C6H8O7 — Acide citrique
# ----------------------------------------------------------
func creer_molecule_C6H8O7(centre: Vector3):
	# HOOC-CH2-C(OH)(COOH)-CH2-COOH
	var c1  = spawn_atome("C", centre + Vector3(-3.0, 0.0, 0.0))
	var o1  = spawn_atome("O", centre + Vector3(-3.8, 1.0, 0.0))
	var o2  = spawn_atome("O", centre + Vector3(-3.8,-1.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3(-1.5, 0.0, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))  # C central
	var oh3 = spawn_atome("O", centre + Vector3( 0.0, 1.3, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 1.5))  # COOH central
	var o4  = spawn_atome("O", centre + Vector3( 0.0, 1.0, 2.2))
	var o5  = spawn_atome("O", centre + Vector3( 0.0,-1.0, 2.2))
	var c5  = spawn_atome("C", centre + Vector3( 1.5, 0.0, 0.0))
	var c6  = spawn_atome("C", centre + Vector3( 3.0, 0.0, 0.0))
	var o6  = spawn_atome("O", centre + Vector3( 3.8, 1.0, 0.0))
	var o7  = spawn_atome("O", centre + Vector3( 3.8,-1.0, 0.0))
	var h1  = spawn_atome("H", centre + Vector3(-4.6,-0.5, 0.0))
	var hoh = spawn_atome("H", centre + Vector3( 0.0, 2.1, 0.5))
	var h5  = spawn_atome("H", centre + Vector3( 4.6,-0.5, 0.0))
	var h4  = spawn_atome("H", centre + Vector3( 0.0,-1.0, 2.9))
	var hb1 = spawn_atome("H", centre + Vector3(-1.5, 0.9,-0.6))
	var hb2 = spawn_atome("H", centre + Vector3(-1.5,-0.9,-0.6))
	var hb3 = spawn_atome("H", centre + Vector3( 1.5, 0.9,-0.6))
	var hb4 = spawn_atome("H", centre + Vector3( 1.5,-0.9,-0.6))
	spawn_liaison(c1,o1); spawn_liaison(c1,o2); spawn_liaison(c1,c2)
	spawn_liaison(c2,c3); spawn_liaison(c3,oh3); spawn_liaison(c3,c4); spawn_liaison(c3,c5)
	spawn_liaison(c4,o4); spawn_liaison(c4,o5)
	spawn_liaison(c5,c6); spawn_liaison(c6,o6); spawn_liaison(c6,o7)
	spawn_liaison(o2,h1); spawn_liaison(oh3,hoh); spawn_liaison(o7,h5); spawn_liaison(o5,h4)
	spawn_liaison(c2,hb1); spawn_liaison(c2,hb2)
	spawn_liaison(c5,hb3); spawn_liaison(c5,hb4)

# ----------------------------------------------------------
# C6H8O7 (iso) — Acide isocitrique
# ----------------------------------------------------------
#func creer_molecule_C6H8O7_iso(centre: Vector3):
	## Isomère : HOOC-CH(OH)-CH(COOH)-CH2-COOH
	#var c1  = spawn_atome("C", centre + Vector3(-3.0, 0.0, 0.0))
	#var o1  = spawn_atome("O", centre + Vector3(-3.8, 1.0, 0.0))
	#var o2  = spawn_atome("O", centre + Vector3(-3.8,-1.0, 0.0))
	#var c2  = spawn_atome("C", centre + Vector3(-1.5, 0.0, 0.0))  # CH(OH)
	#var oh2 = spawn_atome("O", centre + Vector3(-1.5, 1.3, 0.0))
	#var c3  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))  # CH(COOH)
	#var c4  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 1.5))  # COOH latéral
	#var o4  = spawn_atome("O", centre + Vector3( 0.0, 1.0, 2.2))
	#var o5  = spawn_atome("O", centre + Vector3( 0.0,-1.0, 2.2))
	#var c5  = spawn_atome("C", centre + Vector3( 1.5, 0.0, 0.0))
	#var c6  = spawn_atome("C", centre + Vector3( 3.0, 0.0, 0.0))
	#var o6  = spawn_atome("O", centre + Vector3( 3.8, 1.0, 0.0))
	#var o7  = spawn_atome("O", centre + Vector3( 3.8,-1.0, 0.0))
	#var h1  = spawn_atome("H", centre + Vector3(-4.6,-0.5, 0.0))
	#var h2  = spawn_atome("H", centre + Vector3(-1.5,-1.0,-0.5))
	#var hoh = spawn_atome("H", centre + Vector3(-1.5, 2.1, 0.5))
	#var h3  = spawn_atome("H", centre + Vector3( 0.0,-1.0,-0.5))
	#var h4  = spawn_atome("H", centre + Vector3( 0.0,-1.0, 2.9))
	#var hb1 = spawn_atome("H", centre + Vector3( 1.5, 0.9,-0.6))
	#var hb2 = spawn_atome("H", centre + Vector3( 1.5,-0.9,-0.6))
	#var h6  = spawn_atome("H", centre + Vector3( 4.6,-0.5, 0.0))
	#spawn_liaison(c1,o1); spawn_liaison(c1,o2); spawn_liaison(c1,c2)
	#spawn_liaison(c2,oh2); spawn_liaison(c2,c3)
	#spawn_liaison(c3,c4); spawn_liaison(c3,c5)
	#spawn_liaison(c4,o4); spawn_liaison(c4,o5)
	#spawn_liaison(c5,c6); spawn_liaison(c6,o6); spawn_liaison(c6,o7)
	#spawn_liaison(o2,h1); spawn_liaison(c2,h2); spawn_liaison(oh2,hoh)
	#spawn_liaison(c3,h3); spawn_liaison(o5,h4)
	#spawn_liaison(c5,hb1); spawn_liaison(c5,hb2); spawn_liaison(o7,h6)

# ----------------------------------------------------------
# C4H6O4 — Acide succinique
# ----------------------------------------------------------
func creer_molecule_C4H6O4(centre: Vector3):
	# HOOC-CH2-CH2-COOH
	var c1  = spawn_atome("C", centre + Vector3(-2.0, 0.0, 0.0))
	var o1  = spawn_atome("O", centre + Vector3(-2.8, 1.0, 0.0))
	var o2  = spawn_atome("O", centre + Vector3(-2.8,-1.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3(-0.5, 0.0, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.5, 0.0, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 2.0, 0.0, 0.0))
	var o3  = spawn_atome("O", centre + Vector3( 2.8, 1.0, 0.0))
	var o4  = spawn_atome("O", centre + Vector3( 2.8,-1.0, 0.0))
	var h1  = spawn_atome("H", centre + Vector3(-3.5,-0.5, 0.0))
	var h2  = spawn_atome("H", centre + Vector3( 3.5,-0.5, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3(-0.5, 0.9,-0.6))
	var hb2 = spawn_atome("H", centre + Vector3(-0.5,-0.9,-0.6))
	var hb3 = spawn_atome("H", centre + Vector3( 0.5, 0.9,-0.6))
	var hb4 = spawn_atome("H", centre + Vector3( 0.5,-0.9,-0.6))
	spawn_liaison(c1,o1); spawn_liaison(c1,o2); spawn_liaison(c1,c2)
	spawn_liaison(c2,c3); spawn_liaison(c3,c4)
	spawn_liaison(c4,o3); spawn_liaison(c4,o4)
	spawn_liaison(o2,h1); spawn_liaison(o4,h2)
	spawn_liaison(c2,hb1); spawn_liaison(c2,hb2)
	spawn_liaison(c3,hb3); spawn_liaison(c3,hb4)

# ----------------------------------------------------------
# C4H4O4 — Acide fumarique
# ----------------------------------------------------------
func creer_molecule_C4H4O4(centre: Vector3):
	# HOOC-CH=CH-COOH (trans)
	var c1  = spawn_atome("C", centre + Vector3(-2.0, 0.0, 0.0))
	var o1  = spawn_atome("O", centre + Vector3(-2.8, 1.0, 0.0))
	var o2  = spawn_atome("O", centre + Vector3(-2.8,-1.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3(-0.6, 0.0, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.6, 0.0, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 2.0, 0.0, 0.0))
	var o3  = spawn_atome("O", centre + Vector3( 2.8, 1.0, 0.0))
	var o4  = spawn_atome("O", centre + Vector3( 2.8,-1.0, 0.0))
	var h1  = spawn_atome("H", centre + Vector3(-3.5,-0.5, 0.0))
	var h2  = spawn_atome("H", centre + Vector3( 3.5,-0.5, 0.0))
	var hv1 = spawn_atome("H", centre + Vector3(-0.2, 1.0, 0.0))
	var hv2 = spawn_atome("H", centre + Vector3( 0.2,-1.0, 0.0))
	spawn_liaison(c1,o1); spawn_liaison(c1,o2); spawn_liaison(c1,c2)
	spawn_liaison(c2,c3); spawn_liaison(c3,c4)
	spawn_liaison(c4,o3); spawn_liaison(c4,o4)
	spawn_liaison(o2,h1); spawn_liaison(o4,h2)
	spawn_liaison(c2,hv1); spawn_liaison(c3,hv2)

# ----------------------------------------------------------
# C4H6O5 — Acide malique
# ----------------------------------------------------------
func creer_molecule_C4H6O5(centre: Vector3):
	# HOOC-CHOH-CH2-COOH
	var c1  = spawn_atome("C", centre + Vector3(-2.0, 0.0, 0.0))
	var o1  = spawn_atome("O", centre + Vector3(-2.8, 1.0, 0.0))
	var o2  = spawn_atome("O", centre + Vector3(-2.8,-1.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3(-0.5, 0.0, 0.0))
	var oh2 = spawn_atome("O", centre + Vector3(-0.5, 1.3, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.8, 0.0, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 2.2, 0.0, 0.0))
	var o3  = spawn_atome("O", centre + Vector3( 3.0, 1.0, 0.0))
	var o4  = spawn_atome("O", centre + Vector3( 3.0,-1.0, 0.0))
	var h1  = spawn_atome("H", centre + Vector3(-3.5,-0.5, 0.0))
	var h2  = spawn_atome("H", centre + Vector3(-0.5,-1.0,-0.5))
	var hoh = spawn_atome("H", centre + Vector3(-0.5, 2.0, 0.5))
	var hb1 = spawn_atome("H", centre + Vector3( 0.8, 0.9,-0.6))
	var hb2 = spawn_atome("H", centre + Vector3( 0.8,-0.9,-0.6))
	var h4  = spawn_atome("H", centre + Vector3( 3.7,-0.5, 0.0))
	spawn_liaison(c1,o1); spawn_liaison(c1,o2); spawn_liaison(c1,c2)
	spawn_liaison(c2,oh2); spawn_liaison(c2,c3); spawn_liaison(c3,c4)
	spawn_liaison(c4,o3); spawn_liaison(c4,o4)
	spawn_liaison(o2,h1); spawn_liaison(c2,h2); spawn_liaison(oh2,hoh)
	spawn_liaison(c3,hb1); spawn_liaison(c3,hb2); spawn_liaison(o4,h4)

# ----------------------------------------------------------
# C4H4O5 — Acide oxaloacétique
# ----------------------------------------------------------
func creer_molecule_C4H4O5(centre: Vector3):
	# HOOC-CO-CH2-COOH
	var c1  = spawn_atome("C", centre + Vector3(-2.0, 0.0, 0.0))
	var o1  = spawn_atome("O", centre + Vector3(-2.8, 1.0, 0.0))
	var o2  = spawn_atome("O", centre + Vector3(-2.8,-1.0, 0.0))
	var c2  = spawn_atome("C", centre + Vector3(-0.5, 0.0, 0.0))  # C=O cétonique
	var ok  = spawn_atome("O", centre + Vector3(-0.5, 1.3, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.8, 0.0, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 2.2, 0.0, 0.0))
	var o3  = spawn_atome("O", centre + Vector3( 3.0, 1.0, 0.0))
	var o4  = spawn_atome("O", centre + Vector3( 3.0,-1.0, 0.0))
	var h1  = spawn_atome("H", centre + Vector3(-3.5,-0.5, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 0.8, 0.9,-0.6))
	var hb2 = spawn_atome("H", centre + Vector3( 0.8,-0.9,-0.6))
	var h4  = spawn_atome("H", centre + Vector3( 3.7,-0.5, 0.0))
	spawn_liaison(c1,o1); spawn_liaison(c1,o2); spawn_liaison(c1,c2)
	spawn_liaison(c2,ok); spawn_liaison(c2,c3); spawn_liaison(c3,c4)
	spawn_liaison(c4,o3); spawn_liaison(c4,o4)
	spawn_liaison(o2,h1); spawn_liaison(c3,hb1); spawn_liaison(c3,hb2); spawn_liaison(o4,h4)

# ----------------------------------------------------------
# C5H10O5 — D-Ribose
# ----------------------------------------------------------
func creer_molecule_C5H10O5(centre: Vector3):
	# Forme ouverte : CHO-CHOH-CHOH-CHOH-CH2OH
	var c1  = spawn_atome("C", centre + Vector3( 0.0, 2.4, 0.0))
	var o1  = spawn_atome("O", centre + Vector3( 1.0, 3.1, 0.0))  # aldéhyde
	var c2  = spawn_atome("C", centre + Vector3( 0.0, 1.2, 0.0))
	var oh2 = spawn_atome("O", centre + Vector3( 1.3, 1.2, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.0, 0.0, 0.0))
	var oh3 = spawn_atome("O", centre + Vector3(-1.3, 0.0, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 0.0,-1.2, 0.0))
	var oh4 = spawn_atome("O", centre + Vector3( 1.3,-1.2, 0.0))
	var c5  = spawn_atome("C", centre + Vector3( 0.0,-2.4, 0.0))
	var oh5 = spawn_atome("O", centre + Vector3( 0.0,-3.6, 0.0))
	var h1  = spawn_atome("H", centre + Vector3(-1.0, 2.8, 0.0))
	var h2  = spawn_atome("H", centre + Vector3(-1.0, 1.2, 0.0))
	var hoh2 = spawn_atome("H", centre + Vector3( 2.0, 0.6, 0.0))
	var h3  = spawn_atome("H", centre + Vector3( 1.0, 0.0, 0.0))
	var hoh3 = spawn_atome("H", centre + Vector3(-2.0,-0.6, 0.0))
	var h4  = spawn_atome("H", centre + Vector3(-1.0,-1.2, 0.0))
	var hoh4 = spawn_atome("H", centre + Vector3( 2.0,-0.6, 0.0))
	var hb1 = spawn_atome("H", centre + Vector3( 1.0,-2.4, 0.0))
	var hb2 = spawn_atome("H", centre + Vector3(-1.0,-2.4, 0.0))
	var hoh5 = spawn_atome("H", centre + Vector3( 0.0,-4.4, 0.5))
	spawn_liaison(c1,o1); spawn_liaison(c1,c2)
	spawn_liaison(c2,oh2); spawn_liaison(c2,c3)
	spawn_liaison(c3,oh3); spawn_liaison(c3,c4)
	spawn_liaison(c4,oh4); spawn_liaison(c4,c5)
	spawn_liaison(c5,oh5)
	spawn_liaison(c1,h1); spawn_liaison(c2,h2); spawn_liaison(oh2,hoh2)
	spawn_liaison(c3,h3); spawn_liaison(oh3,hoh3)
	spawn_liaison(c4,h4); spawn_liaison(oh4,hoh4)
	spawn_liaison(c5,hb1); spawn_liaison(c5,hb2); spawn_liaison(oh5,hoh5)

# ----------------------------------------------------------
# C6H12O6 (galactose) — D-Galactose
# ----------------------------------------------------------
func creer_molecule_C6H12O6_galactose(centre: Vector3):
	# Forme ouverte : CHO-(CHOH)4-CH2OH
	var c1  = spawn_atome("C", centre + Vector3( 0.0, 3.0, 0.0))
	var o1  = spawn_atome("O", centre + Vector3( 1.0, 3.7, 0.0))
	var c2  = spawn_atome("C", centre + Vector3( 0.0, 1.8, 0.0))
	var oh2 = spawn_atome("O", centre + Vector3( 1.3, 1.8, 0.0))
	var c3  = spawn_atome("C", centre + Vector3( 0.0, 0.6, 0.0))
	var oh3 = spawn_atome("O", centre + Vector3(-1.3, 0.6, 0.0))
	var c4  = spawn_atome("C", centre + Vector3( 0.0,-0.6, 0.0))
	var oh4 = spawn_atome("O", centre + Vector3( 1.3,-0.6, 0.0))
	var c5  = spawn_atome("C", centre + Vector3( 0.0,-1.8, 0.0))
	var oh5 = spawn_atome("O", centre + Vector3(-1.3,-1.8, 0.0))
	var c6  = spawn_atome("C", centre + Vector3( 0.0,-3.0, 0.0))
	var oh6 = spawn_atome("O", centre + Vector3( 0.0,-4.2, 0.0))
	# Hydrogènes sur chaque carbone
	var h1  = spawn_atome("H", centre + Vector3(-1.0, 3.4, 0.0))
	var h2  = spawn_atome("H", centre + Vector3(-1.0, 1.8, 0.0))
	var h3  = spawn_atome("H", centre + Vector3( 1.0, 0.6, 0.0))
	var h4  = spawn_atome("H", centre + Vector3(-1.0,-0.6, 0.0))
	var h5  = spawn_atome("H", centre + Vector3( 1.0,-1.8, 0.0))
	var h61 = spawn_atome("H", centre + Vector3( 1.0,-3.0, 0.0))
	var h62 = spawn_atome("H", centre + Vector3(-1.0,-3.0, 0.0))
	var hoh2 = spawn_atome("H", centre + Vector3( 2.0, 1.2, 0.0))
	var hoh3 = spawn_atome("H", centre + Vector3(-2.0, 0.0, 0.0))
	var hoh4 = spawn_atome("H", centre + Vector3( 2.0,-0.0, 0.0))
	var hoh5 = spawn_atome("H", centre + Vector3(-2.0,-2.4, 0.0))
	var hoh6 = spawn_atome("H", centre + Vector3( 0.0,-5.0, 0.5))
	spawn_liaison(c1,o1); spawn_liaison(c1,c2); spawn_liaison(c2,oh2); spawn_liaison(c2,c3)
	spawn_liaison(c3,oh3); spawn_liaison(c3,c4); spawn_liaison(c4,oh4); spawn_liaison(c4,c5)
	spawn_liaison(c5,oh5); spawn_liaison(c5,c6); spawn_liaison(c6,oh6)
	spawn_liaison(c1,h1); spawn_liaison(c2,h2); spawn_liaison(c3,h3)
	spawn_liaison(c4,h4); spawn_liaison(c5,h5); spawn_liaison(c6,h61); spawn_liaison(c6,h62)
	spawn_liaison(oh2,hoh2); spawn_liaison(oh3,hoh3); spawn_liaison(oh4,hoh4)
	spawn_liaison(oh5,hoh5); spawn_liaison(oh6,hoh6)

# ----------------------------------------------------------
# C6H12O6 (mannose) — D-Mannose
# ----------------------------------------------------------
#func creer_molecule_C6H12O6_mannose(centre: Vector3):
	## Même squelette que galactose, configuration C2 inversée
	#var c1  = spawn_atome("C", centre + Vector3( 0.0, 3.0, 0.0))
	#var o1  = spawn_atome("O", centre + Vector3( 1.0, 3.7, 0.0))
	#var c2  = spawn_atome("C", centre + Vector3( 0.0, 1.8, 0.0))
	#var oh2 = spawn_atome("O", centre + Vector3(-1.3, 1.8, 0.0))  # inversé vs galactose
	#var c3  = spawn_atome("C", centre + Vector3( 0.0, 0.6, 0.0))
	#var oh3 = spawn_atome("O", centre + Vector3( 1.3, 0.6, 0.0))
	#var c4  = spawn_atome("C", centre + Vector3( 0.0,-0.6, 0.0))
	#var oh4 = spawn_atome("O", centre + Vector3(-1.3,-0.6, 0.0))
	#var c5  = spawn_atome("C", centre + Vector3( 0.0,-1.8, 0.0))
	#var oh5 = spawn_atome("O", centre + Vector3( 1.3,-1.8, 0.0))
	#var c6  = spawn_atome("C", centre + Vector3( 0.0,-3.0, 0.0))
	#var oh6 = spawn_atome("O", centre + Vector3( 0.0,-4.2, 0.0))
	#var h1  = spawn_atome("H", centre + Vector3(-1.0, 3.4, 0.0))
	#var h2  = spawn_atome("H", centre + Vector3( 1.0, 1.8, 0.0))
	#var h3  = spawn_atome("H", centre + Vector3(-1.0, 0.6, 0.0))
	#var h4  = spawn_atome("H", centre + Vector3( 1.0,-0.6, 0.0))
	#var h5  = spawn_atome("H", centre + Vector3(-1.0,-1.8, 0.0))
	#var h61 = spawn_atome("H", centre + Vector3( 1.0,-3.0, 0.0))
	#var h62 = spawn_atome("H", centre + Vector3(-1.0,-3.0, 0.0))
	#var hoh2 = spawn_atome("H", centre + Vector3(-2.0, 1.2, 0.0))
	#var hoh3 = spawn_atome("H", centre + Vector3( 2.0, 0.0, 0.0))
	#var hoh4 = spawn_atome("H", centre + Vector3(-2.0,-1.2, 0.0))
	#var hoh5 = spawn_atome("H", centre + Vector3( 2.0,-2.4, 0.0))
	#var hoh6 = spawn_atome("H", centre + Vector3( 0.0,-5.0, 0.5))
	#spawn_liaison(c1,o1); spawn_liaison(c1,c2); spawn_liaison(c2,oh2); spawn_liaison(c2,c3)
	#spawn_liaison(c3,oh3); spawn_liaison(c3,c4); spawn_liaison(c4,oh4); spawn_liaison(c4,c5)
	#spawn_liaison(c5,oh5); spawn_liaison(c5,c6); spawn_liaison(c6,oh6)
	#spawn_liaison(c1,h1); spawn_liaison(c2,h2); spawn_liaison(c3,h3)
	#spawn_liaison(c4,h4); spawn_liaison(c5,h5); spawn_liaison(c6,h61); spawn_liaison(c6,h62)
	#spawn_liaison(oh2,hoh2); spawn_liaison(oh3,hoh3); spawn_liaison(oh4,hoh4)
	#spawn_liaison(oh5,hoh5); spawn_liaison(oh6,hoh6)
