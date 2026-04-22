extends Node2D

@onready var azoteObjet = preload("res://objetsElements/azote.tscn")
@onready var carboneObjet = preload("res://objetsElements/carbone.tscn")
@onready var hydrogeneObjet = preload("res://objetsElements/hydrogene.tscn")
@onready var oxygeneObjet = preload("res://objetsElements/oxygene.tscn")
@onready var soufreObjet = preload("res://objetsElements/soufre.tscn")

var atome_a_objet = null
var atome_b_objet = null
var liaisons_visuelles = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LiaisonA.hide()
	$LiaisonB.hide()
	$LiaisonComplete.hide()
	$EinsteinTesla.hide()
	$Explosion.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("esc"):
		selected_a = null
		selected_b = null
		atome_a_objet = null
		atome_b_objet = null
		for node in [$LiaisonA, $LiaisonB, $LiaisonComplete]:
			node.hide()
	for liaison in liaisons_visuelles:
		var decalages = []
		if liaison[2].size() == 1:
			decalages = [Vector2(0, 0)]
		elif liaison[2].size() == 2:
			decalages = [Vector2(0, -4), Vector2(0, 4)]
		elif liaison[2].size() == 3:
			decalages = [Vector2(0, -6), Vector2(0, 0), Vector2(0, 6)]
		for i in liaison[2].size():
			liaison[2][i].set_point_position(0, liaison[0].global_position + decalages[i])
			liaison[2][i].set_point_position(1, liaison[1].global_position + decalages[i])

var rng = RandomNumberGenerator.new() #genere un nombre aleatoire pour que, lorsque plusieurs atomes sont isntanciées, ils ne superposent pas

func _on_add_hydro_pressed() -> void:
	Inventaire.update_item("H")
	$ItemList._rajouter_item()
	var new_id = Inventaire.inventaire.keys().back()
	print("button pressed")
	var temp = hydrogeneObjet.instantiate()
	add_child(temp)
	temp.inventaire_id = new_id
	temp.atom_clicked.connect(_on_atom_clicked)
	temp.global_position = Vector2(250 + rng.randf_range(-30.0, 30.0), 250+rng.randf_range(-30.0, 30.0))

func _on_add_carbone_pressed() -> void:
	Inventaire.update_item("C")
	$ItemList._rajouter_item()
	var new_id = Inventaire.inventaire.keys().back()
	print("button pressed")
	var temp = carboneObjet.instantiate()
	add_child(temp)
	temp.inventaire_id = new_id
	temp.atom_clicked.connect(_on_atom_clicked)
	temp.global_position = Vector2(250 + rng.randf_range(-30.0, 30.0), 250+rng.randf_range(-30.0, 30.0))


func _on_add_azote_pressed() -> void:
	Inventaire.update_item("N")
	$ItemList._rajouter_item()
	var new_id = Inventaire.inventaire.keys().back()
	print("button pressed")
	var temp = azoteObjet.instantiate()
	add_child(temp)
	temp.inventaire_id = new_id
	temp.atom_clicked.connect(_on_atom_clicked)
	temp.global_position = Vector2(250 + rng.randf_range(-30.0, 30.0), 250+rng.randf_range(-30.0, 30.0))

func _on_add_oxygene_pressed() -> void:
	Inventaire.update_item("O")
	$ItemList._rajouter_item()
	var new_id = Inventaire.inventaire.keys().back()
	print("button pressed")
	var temp = oxygeneObjet.instantiate()
	add_child(temp)
	temp.inventaire_id = new_id
	temp.atom_clicked.connect(_on_atom_clicked)
	temp.global_position = Vector2(250 + rng.randf_range(-30.0, 30.0), 250+rng.randf_range(-30.0, 30.0))

func _on_add_soufre_pressed() -> void:
	Inventaire.update_item("S")
	$ItemList._rajouter_item()
	var new_id = Inventaire.inventaire.keys().back()
	print("button pressed")
	var temp = soufreObjet.instantiate()
	add_child(temp)
	temp.inventaire_id = new_id
	temp.atom_clicked.connect(_on_atom_clicked)
	temp.global_position = Vector2(250 + rng.randf_range(-30.0, 30.0), 250+rng.randf_range(-30.0, 30.0))
	
var type_liaison = "SIMPLE"
func _on_add_simple_pressed() -> void:
	type_liaison = "SIMPLE"
	$LiaisonComplete.hide()
	$LiaisonA.show()

func _on_add_double_pressed() -> void:
	type_liaison = "DOUBLE"
	$LiaisonComplete.hide()
	$LiaisonA.show()
func _on_add_triple_pressed() -> void:
	type_liaison = "TRIPLE"
	$LiaisonComplete.hide()
	$LiaisonA.show()	
var selected_a = null
var selected_b = null
var temp_array = []
#enum liaisons {SIMPLE, DOUBLE, TRIPLE}
func _on_atom_clicked(atom_node) -> void:
	if $LiaisonA.visible == false and $LiaisonB.visible == false:
		return
	if selected_a == null:
		selected_a = atom_node.inventaire_id
		atome_a_objet = atom_node
		$LiaisonA.hide()
		$LiaisonB.show()
	elif selected_b == null and atom_node.inventaire_id != selected_a:
		selected_b = atom_node.inventaire_id
		atome_b_objet = atom_node
		var atome_a = Inventaire.inventaire[selected_a]
		var atome_b = Inventaire.inventaire[selected_b]
		print(atome_a["type"] + " a été combiné avec " + atome_b["type"] + " ! ")
		atome_a["liaisons_actuelles"] += 1
		atome_b["liaisons_actuelles"] += 1
		var encore_un_array = []
		encore_un_array.append(atome_a["symbole"])
		encore_un_array.append(atome_b["symbole"])
		encore_un_array.sort()
		encore_un_array.append(type_liaison)
		var s = array_to_string(encore_un_array)
		print(s)
		temp_array.append(Liaisons.code_liaison[s])
			#debut tracage de ligne, utilise Claude
		var decalages = []
		var couleur = Color.RED

		if type_liaison == "SIMPLE":
			decalages = [0.0]
			couleur = Color.RED
		elif type_liaison == "DOUBLE":
			decalages = [-8.0, 8.0]
			couleur = Color.YELLOW
		elif type_liaison == "TRIPLE":
			decalages = [-10.0, 0.0, 10.0]
			couleur = Color.CYAN
		var dir = (atome_b_objet.global_position - atome_a_objet.global_position).normalized()
		if dir == Vector2.ZERO:
			return
		var perp = Vector2(-dir.y, dir.x)

		var rayon_a = atome_a_objet.find_child("CollisionShape2D").shape.size.x / 2
		var rayon_b = atome_b_objet.find_child("CollisionShape2D").shape.size.x / 2

		var lignes = []
		for d in decalages:
			var ligne = Line2D.new()
			ligne.add_point(atome_a_objet.global_position + dir * rayon_a + perp * d)
			ligne.add_point(atome_b_objet.global_position - dir * rayon_b + perp * d)
			ligne.width = 2
			ligne.default_color = couleur
			add_child(ligne)
			lignes.append(ligne)

		liaisons_visuelles.append([atome_a_objet, atome_b_objet, lignes])
		atome_a_objet = null
		atome_b_objet = null
			#fin tracage de ligne
		selected_a = null
		selected_b = null
		$LiaisonB.hide()
		$LiaisonComplete.show()
		$Timer.start()
		
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i)
	return s

func _on_timer_timeout() -> void:
	$LiaisonComplete.hide()

var decouvertes = []

func _on_creer_pressed() -> void:
	print("vérifions...")
	var s = array_to_string(temp_array)
	print("liaison string: " + s)  # add this
	var elements_ajoutees = []
	for id in Inventaire.inventaire:
		elements_ajoutees.append(Inventaire.inventaire[id]["symbole"])	#on collecte tout nos elements dans un array pour ensuite voir quel molecule a ces mêmes éléments.
	elements_ajoutees.sort()
	for formule in Molecule.formules_valides:
		var elements_molecule = Molecule.formules_valides[formule]["elements"].duplicate()
		elements_molecule.sort()
		
		if elements_ajoutees == Molecule.formules_valides[formule]["elements"]:
			var molecule_formee = Molecule.formules_valides[formule]
			if s == molecule_formee["liaisons"]:
				print("yurr!!!its " +  Molecule.formules_valides[formule]["nom"] + " baby!!!")
				var molecule = Molecule.formules_valides[formule]
				$CreationReussie.set_molecule(molecule)
				Molecule.decouvertes.append(formule)
		$EinsteinTesla.show()
		$Explosion.show()


func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()


func _on_annexe_pressed() -> void:
	get_tree().change_scene_to_file('res://inventaire_scene.tscn')
