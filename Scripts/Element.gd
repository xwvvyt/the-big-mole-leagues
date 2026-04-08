extends Node

var ELEMENTS: Dictionary = {
	"C": {
		"type": "Carbone",
		"symbole": "C",
		"max_liaisons": 4,
		"liaisons_actuelles": 0,
		"couleure": Color.BLACK
	},
	"H": {
		"type": "Hydrogene",
		"symbole": "H",
		"max_liaisons": 1,
		"liaisons_actuelles": 0,
		"couleure": Color.WHITE
	},
	"O": {
		"type": "Oxygene",
		"symbole": "O",
		"max_liaisons": 2,
		"liaisons_actuelles": 0,
		"couleure": Color.RED

	},
	"N": {
		"type": "Azote",
		"symbole": "N",
		"max_liaisons": 3,
		"liaisons_actuelles": 0,
		"couleure": Color.BLUE
	},
	"S": {
		"type": "Soufre",
		"symbole": "S",
		"max_liaisons": 2,
		"liaisons_actuelles": 0,
		"couleure": Color.YELLOW
	}
	#"Benzene": {
		#"type": "Benzene",
		#"symbole": "C6H6",
		#"max_liaisons": 3,
		#"liaisons_actuelles": 0
	#}
}
