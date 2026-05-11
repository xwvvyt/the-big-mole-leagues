extends Node2D


var hydrogenScene = preload("res://UI/User Int/HydrogeneDND.tscn")
var oxygenScene = preload("res://UI/User Int/OxygenDND.tscn")
var carbonScene = preload("res://UI/User Int/CarbonDND.tscn")
var nitrogenScene = preload("res://UI/User Int/NitrogenDND.tscn")
var soufreScene = preload("res://UI/User Int/SoufreDND.tscn")

var hydrogen_instance
var oxygen_instance
var carbon_instance
var nitrogen_instance
var soufre_instance

var reset = false

var elements_ajoutees: Array = []

func _ready() -> void:
	$EinsteinTesla.hide()
	$Explosion.hide()
	$Button/Boom.hide()
	$vantHoff.hide()
	$echec.hide()
	hydrogen_instance = instHydrogen()
	oxygen_instance = instOxygen()
	carbon_instance = instCarbon()
	nitrogen_instance = instNitrogen()
	soufre_instance = instSoufre()

func _process(delta):
	if hydrogen_instance.isDropped:
		elements_ajoutees.append("H")
		elements_ajoutees.sort()
		hydrogen_instance.add_to_group("droppedElements")
		hydrogen_instance = instHydrogen()
	if oxygen_instance.isDropped:
		elements_ajoutees.append("O")
		elements_ajoutees.sort()
		oxygen_instance.add_to_group("droppedElements")
		oxygen_instance = instOxygen()
	if carbon_instance.isDropped:
		elements_ajoutees.append("C")
		elements_ajoutees.sort()
		carbon_instance.add_to_group("droppedElements")
		carbon_instance = instCarbon()
	if nitrogen_instance.isDropped:
		elements_ajoutees.append("N")
		elements_ajoutees.sort()
		nitrogen_instance.add_to_group("droppedElements")
		nitrogen_instance = instNitrogen()
	if soufre_instance.isDropped:
		elements_ajoutees.append("S")
		elements_ajoutees.sort()
		soufre_instance.add_to_group("droppedElements")
		soufre_instance = instSoufre()

	if reset:
		for node in get_tree().get_nodes_in_group("droppedElements"):
			node.queue_free()
		reset = false
		elements_ajoutees = []

func instHydrogen():
	var instance = hydrogenScene.instantiate()
	instance.position = Vector2(915, 80)
	add_child(instance)
	return instance

func instOxygen():
	var instance = oxygenScene.instantiate()
	instance.position = Vector2(1025, 80)
	add_child(instance)
	return instance

func instCarbon():
	var instance = carbonScene.instantiate()
	instance.position = Vector2(915, 200)
	add_child(instance)
	return instance

func instNitrogen():
	var instance = nitrogenScene.instantiate()
	instance.position = Vector2(1025, 200)
	add_child(instance)
	return instance

func instSoufre():
	var instance = soufreScene.instantiate()
	instance.position = Vector2(975, 320)
	add_child(instance)
	return instance

func _on_button_pressed() -> void:
	$Sound1.play()
	await $Sound1.finished
	$Button/AnimatedSprite2D.play("click")
	$Boom.play()
	await $Button/AnimatedSprite2D.animation_finished
	$Button/Boom.show()
	$Button/Boom.play("default")
	await $Button/Boom.animation_finished
	$Button/Boom.hide()
	
	$EinsteinTesla.hide()
	$Explosion.hide()
	$CreationReussie.hide()
	$vantHoff.hide()
	$echec.hide()
	reset = true

func _on_creer_pressed() -> void:
	print("vérifions...")
	var sorted_elements = elements_ajoutees.duplicate()
	sorted_elements.sort()
	for formule in Molecule.formules_valides:
		var elements_molecule = Molecule.formules_valides[formule]["elements"].duplicate()
		elements_molecule.sort()
		if sorted_elements == elements_molecule:
			print("yurr!!! its " + Molecule.formules_valides[formule]["nom"] + " baby!!!")
			var molecule = Molecule.formules_valides[formule]
			$CreationReussie.set_molecule(molecule)
			Molecule.decouvertes.append(formule)
			$EinsteinTesla.show()
			$Explosion.show()
			$vantHoff.hide()
			$echec.hide()
			return
	
	print("aucune molécule trouvée...")
	$EinsteinTesla.hide()
	$Explosion.hide()
	$CreationReussie.hide()
	$vantHoff.show()
	$echec.show()

func _on_annexe_pressed() -> void:
	get_tree().change_scene_to_file('res://inventaire_scene.tscn')
