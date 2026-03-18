#extends RichTextLabel
#
#
#var statement: String
#
#func _process(delta):
	#for item in Inventaire.inventaire:
		#statement += "Ta rajouté du " + Inventaire.inventaire[item]["type"] + " ! " + "t'en a " + str(Inventaire.inventaire[item]["quantite"]) + " cro! tes liaisons: " + str(Inventaire.inventaire[item]["liaisons"]) + "\n"
	#self.text = statement
	#statement = ""
extends RichTextLabel
var statement: String

func _process(delta):
	statement = ""  # TOP, not bottom
	var seen = []
	for id in Inventaire.inventaire:
		var atome = Inventaire.inventaire[id]
		if atome["symbole"] not in seen:
			seen.append(atome["symbole"])
			statement += "Ta rajouté du " + atome["type"] + " ! " + "t'en a " + str(Inventaire.get_quantity(atome["symbole"])) + " cro! tes liaisons: " + str(atome["liaisons_actuelles"]) + "\n"
	self.text = statement
