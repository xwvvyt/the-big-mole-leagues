extends Node2D

var mynode= preload("res://User Int/atomeDNDtest.tscn")


func _ready() -> void:
	pass


func inst(pos):
	var instance = mynode.instantiate()
	instance.position = pos
	add_child(instance)
	
