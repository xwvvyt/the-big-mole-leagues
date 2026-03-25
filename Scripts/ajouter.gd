extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LiaisonA.hide()
	$LiaisonB.hide()
	$LiaisonComplete.hide()
	$EinsteinTesla.hide()
	$Explosion.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_hydro_pressed() -> void:
	Inventaire.update_item("H")
	$ItemList._rajouter_item()

func _on_add_carbone_pressed() -> void:
	Inventaire.update_item("C")
	$ItemList._rajouter_item()

func _on_add_azote_pressed() -> void:
	Inventaire.update_item("N")
	$ItemList._rajouter_item()

func _on_add_oxygene_pressed() -> void:
	Inventaire.update_item("O")
	$ItemList._rajouter_item()

func _on_add_soufre_pressed() -> void:
	Inventaire.update_item("S")
	$ItemList._rajouter_item()
	
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
func _on_item_list_item_clicked(index: int, at_position: Vector2, mouse_button_index: int) -> void:
	if selected_a == null:
		selected_a = $ItemList.get_item_metadata(index)
		$LiaisonA.hide()
		$LiaisonB.show()
	elif selected_b == null:
		selected_b = $ItemList.get_item_metadata(index)
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
		print(type_liaison)
		var s = array_to_string(encore_un_array)
		print(s)
		temp_array.append(Liaisons.code_liaison[s])
		selected_a = null
		selected_b = null
		$LiaisonB.hide()
		$LiaisonComplete.show()
		$Timer.start
		
func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i)
	return s

func _on_timer_timeout() -> void:
	$LiaisonComplete.hide()


func _on_creer_pressed() -> void:
	print("vérifions...")
	var s = array_to_string(temp_array)
	var elements_ajoutees = []
	for id in Inventaire.inventaire:
		elements_ajoutees.append(Inventaire.inventaire[id]["symbole"])	#on collecte tout nos elements dans un array pour ensuite voir quel molecule a ces mêmes éléments.
	elements_ajoutees.sort()
	for formule in Molecule.formules_valides:
		var elements_molecule = Molecule.formules_valides[formule]["elements"].duplicate()
		elements_molecule.sort()
		
		if elements_ajoutees == Molecule.formules_valides[formule]["elements"]:
			var molecule_formee = Molecule.formules_valides[formule]
			#for id in Inventaire.inventaire:
				#var atome = Inventaire.inventaire[id]
				#var symbole = atome["symbole"]
				#var liaisons_requises = Molecule.formules_valides[formule]["liaisons"][symbole]
			if s == molecule_formee["liaisons"]:
				print("yurr!!!its " +  Molecule.formules_valides[formule]["nom"] + " baby!!!")
				var molecule = Molecule.formules_valides[formule]
				$CreationReussie.set_molecule(molecule)
		$EinsteinTesla.show()
		$Explosion.show()
