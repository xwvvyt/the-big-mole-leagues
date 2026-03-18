extends Node2D

var inventaire: Dictionary = {}

func update_item(item: String, amount: int):
	if inventaire.has(item):
		inventaire[item]["quantite"] += amount
	else:
		inventaire[item] = Element.ELEMENTS[item].duplicate()
		inventaire[item]["quantite"] = amount

	if inventaire[item]["quantite"] <= 0:
		inventaire.erase(item)
