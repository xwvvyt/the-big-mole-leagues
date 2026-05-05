extends RichTextLabel

var statement: String

func _process(delta):
	for item in Inventaire.inventaire:
		statement += Inventaire.inventaire[item]["symbole"] + " : " + str(Inventaire.inventaire[item]["quantite"]) + "\n"
	self.text = statement
	statement = ""
