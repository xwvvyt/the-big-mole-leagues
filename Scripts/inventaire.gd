#extends Node2D
#
#var inventaire: Dictionary = {}
#
#func update_item(item: String, quantite: int, liaisons: int):
	#if inventaire.has(item):
		#inventaire[item]["quantite"] += quantite
		#inventaire[item]["liaisons"] = liaisons
	#else:
		#inventaire[item] = Element.ELEMENTS[item].duplicate()
		#inventaire[item]["quantite"] = quantite
		#inventaire[item]["liaisons"] = liaisons
#
	#if inventaire[item]["quantite"] <= 0:
		#inventaire.erase(item)					
		
extends Node2D

var inventaire: Dictionary = {}

func update_item(item: String):
	var id = randi()
	inventaire[id] = Element.ELEMENTS[item].duplicate()
	inventaire[id]["liaisons_actuelles"] = 0

func remove_item(id: int):
	inventaire.erase(id)

func get_quantity(item: String) -> int:
	var count = 0
	for id in inventaire:
		if inventaire[id]["symbole"] == item:
			count += 1
	return count
