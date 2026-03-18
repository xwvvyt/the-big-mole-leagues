class_name Liaison extends Node 

var type_liaison := 0
var atome1 := Element
var atome2 := Element

#Called when the node enters the scene tree for the first time.
func _connecter(a: Element, b: Element) -> void:
	if a._get_paires_libres() != 0 and b._get_paires_libres() != 0 :
		print(a.type + " a été combiné avec " + b.type + " ! ")

		if type_liaison == 0 or type_liaison == 3 or type_liaison == 4:
			a.liaisons_actualles += 1
			b.liaisons_actualles += 1
		elif  type_liaison == 1:
			a.liaisons_actualles += 2
			b.liaisons_actualles += 2
		elif  type_liaison == 2:
			a.liaisons_actualles += 3
			b.liaisons_actualles += 3						
