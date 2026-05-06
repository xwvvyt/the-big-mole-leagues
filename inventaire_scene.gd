extends Node2D

@onready var jeu_3d = $SubViewportContainer/SubViewport/MonJeu

func _ready() -> void:
	print(Molecule.decouvertes)
	var buttons = get_tree().get_nodes_in_group("buttons")
	for button in buttons:
		button.hide()
		button.pressed.connect(_on_any_button_pressed.bind(button.name))
	for formule in Molecule.decouvertes:
		montrer_molecule(formule)

func montrer_molecule(button_name: String):
	if Molecule.formules_valides.has(str(button_name)):
		find_child(str(button_name)).show()

func _on_any_button_pressed(button_name: String):
	if Molecule.formules_valides.has(str(button_name)):
		var molecule = Molecule.formules_valides[str(button_name)]
		$Info.text = "Nom: " + molecule["nom"] + "\nFormule: " + molecule["formule"] + "\nProprietes: " + molecule["proprietes"]
		jeu_3d.clear_molecule()
		jeu_3d.call("creer_molecule_" + button_name, Vector3.ZERO)

func _process(delta: float) -> void:
	pass

func _on_revenir_pressed() -> void:
	get_tree().change_scene_to_file('res://UI/ui_2.tscn')
