extends RichTextLabel

var statement: String

var molecule_trouvee: Dictionary = {}

func set_molecule(molecule: Dictionary):
	molecule_trouvee = molecule
	text = "incroyable... tu a crée " + molecule_trouvee["nom"] + "... \nes-tu AVOGADRO?"
