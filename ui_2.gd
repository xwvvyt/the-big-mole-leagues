extends Node2D

var hydrogenScene = preload("res://User Int/HydrogeneDND.tscn")
var oxygenScene = preload("res://User Int/OxygenDND.tscn")
var carbonScene = preload("res://User Int/CarbonDND.tscn")
var nitrogenScene = preload("res://User Int/NitrogenDND.tscn")

var nbHydrogen =0
var nbOxygen = 0
var nbCarbon =0
var nbNitrogen = 0

var hydrogen_instance
var oxygen_instance
var carbon_instance
var nitrogen_instance

var reset = false

func _ready() -> void:
	hydrogen_instance = instHydrogen()
	oxygen_instance = instOxygen()
	carbon_instance = instCarbon()
	nitrogen_instance = instNitrogen()
	

func _process(delta):
	
	#Respective element counter + element respawn
	if hydrogen_instance.isDropped:
		nbHydrogen = nbHydrogen+1
		hydrogen_instance.add_to_group("droppedElements")
		hydrogen_instance = instHydrogen()
	if oxygen_instance.isDropped:
		nbOxygen = nbOxygen+1
		oxygen_instance.add_to_group("droppedElements")
		oxygen_instance = instOxygen()	
	if carbon_instance.isDropped:
		nbCarbon = nbCarbon+1
		carbon_instance.add_to_group("droppedElements")
		carbon_instance = instCarbon()	
	if nitrogen_instance.isDropped:
		nbNitrogen = nbNitrogen+1
		nitrogen_instance.add_to_group("droppedElements")
		nitrogen_instance = instNitrogen()
	
	#Clear crafting table
	if reset:
		for node in get_tree().get_nodes_in_group("droppedElements"):
			node.queue_free()
		reset = false
		nbCarbon = 0
		nbHydrogen = 0
		nbNitrogen = 0
		nbOxygen = 0
	
	



#Instantiate atoms
func instHydrogen():
	var instance = hydrogenScene.instantiate()
	instance.position = Vector2(1000,25)
	add_child(instance)
	return instance
func instOxygen():
	var instance = oxygenScene.instantiate()
	instance.position = Vector2(1000,150)
	add_child(instance)
	return instance
func instCarbon():
	var instance = carbonScene.instantiate()
	instance.position = Vector2(1000,275)
	add_child(instance)
	return instance
func instNitrogen():
	var instance = nitrogenScene.instantiate()
	instance.position = Vector2(1000,400)
	add_child(instance)
	return instance

#reset function
func _on_button_pressed() -> void:
	reset = true
