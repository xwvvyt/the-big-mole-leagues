extends Node3D
class_name Molecule3D

@export var atome_scene : PackedScene
@export var liaison_scene : PackedScene

func construire(data : Dictionary )-> void:
	var atomes_crees = {}
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
