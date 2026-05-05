extends Node
 #ce dictionnaire stock les informations pour tout les molecules qui peuvent etre formees 

var formules_valides: Dictionary = {
	
	"FakeMolecule": {
		"nom": "FakeMolecule",
		"formule": "H2O",
		"elements": ["H", "H", "O"],
		"liaisons": "HOdHOt",
		"proprietes": "Masse molaire : 18.015 g/mol. Point de fusion : 0.00 °C. Point d'ebullition : 99.974 °C.",
		"geometrieVSEPR": ""
	},
	
	"H2O": {
		"nom": "Eau",
		"formule": "H2O",
		"elements": ["H", "H", "O"],
		"liaisons": "HOsHOs",
		"proprietes": "Masse molaire : 18.015 g/mol. Point de fusion : 0.00 °C. Point d'ebullition : 99.974 °C.",
		"geometrieVSEPR": ""
	},
 
	"C5H5N5": {
		"nom": "Adenine",
		"formule": "C5H5N5",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "N", "N", "N", "N", "N"],
		"liaisons": "CCsCHsCHsCNdCNdCNdCNdCNsCNsCNsCNsCNsHNsHNsHNs",
		"proprietes": "Masse molaire : 135.128 g/mol. Point de fusion : 360 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C5H6N2O2": {
		"nom": "Thymine",
		"formule": "C5H6N2O2",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "N", "N", "O", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "DOUBLE"],
		"proprietes": "Masse molaire : 126.114 g/mol. Point de fusion : 325 °C.",
		"geometrieVSEPR": ""
	},
 
	"C5H5N5O": {
		"nom": "Guanine",
		"formule": "C5H5N5O",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "N", "N", "N", "N", "N", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE"],
		"proprietes": "Masse molaire : 151.127 g/mol. Point de fusion : 360 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C4H5N3O": {
		"nom": "Cytosine",
		"formule": "C4H5N3O",
		"elements": ["C", "C", "C", "C", "H", "H", "H", "H", "H", "N", "N", "N", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "DOUBLE"],
		"proprietes": "Masse molaire : 111.102 g/mol. Point de fusion : 265 °C.",
		"geometrieVSEPR": ""
	},
 
	"C5H10N2O3": {
		"nom": "L-Glutamine",
		"formule": "C5H10N2O3",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "N", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 146.144 g/mol. Point de fusion : 182 °C.",
		"geometrieVSEPR": ""
	},
 
	"C3H7NO2": {
		"nom": "L-Alanine",
		"formule": "C3H7NO2",
		"elements": ["C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 89.094 g/mol. Point de fusion : 297 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C3H4O3": {
		"nom": "Acide pyruvique",
		"formule": "C3H4O3",
		"elements": ["C", "C", "C", "H", "H", "H", "H", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 88.062 g/mol. Point de fusion : 13.8 °C. Point d'ebullition : 165 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C6H13NO2": {
		"nom": "L-Leucine",
		"formule": "C6H13NO2",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 131.173 g/mol. Point de fusion : 293 °C.",
		"geometrieVSEPR": ""
	},
 
	"C3H7NO3": {
		"nom": "L-Serine",
		"formule": "C3H7NO3",
		"elements": ["C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 105.093 g/mol. Point de fusion : 228 °C (dec). Point d'ebullition : 150 °C subl.",
		"geometrieVSEPR": ""
	},
 
	"C6H14N4O2": {
		"nom": "L-Arginine",
		"formule": "C6H14N4O2",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "N", "N", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 174.201 g/mol. Point de fusion : 260 °C.",
		"geometrieVSEPR": ""
	},
 
	"C6H14N2O2": {
		"nom": "L-Lysine",
		"formule": "C6H14N2O2",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 146.187 g/mol. Point de fusion : 224 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C4H9NO3": {
		"nom": "L-Threonine",
		"formule": "C4H9NO3",
		"elements": ["C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 119.119 g/mol. Point de fusion : 256 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C4H8N2O3": {
		"nom": "L-Asparagine",
		"formule": "C4H8N2O3",
		"elements": ["C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "N", "N", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 132.118 g/mol. Point de fusion : 235 °C.",
		"geometrieVSEPR": ""
	},
 
	"C2H5NO2": {
		"nom": "Glycine",
		"formule": "C2H5NO2",
		"elements": ["C", "C", "H", "H", "H", "H", "H", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 75.067 g/mol. Point de fusion : 290 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C5H11NO2S": {
		"nom": "L-Methionine",
		"formule": "C5H11NO2S",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O", "S"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 149.212 g/mol. Point de fusion : 281 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C11H12N2O2": {
		"nom": "L-Tryptophane",
		"formule": "C11H12N2O2",
		"elements": ["C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "N", "O", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 204.225 g/mol. Point de fusion : 289 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C6H9N3O2": {
		"nom": "L-Histidine",
		"formule": "C6H9N3O2",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "N", "N", "O", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 155.154 g/mol. Point de fusion : 287 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C9H11NO2": {
		"nom": "L-Phenylalanine",
		"formule": "C9H11NO2",
		"elements": ["C", "C", "C", "C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 165.189 g/mol. Point de fusion : 283 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C9H11NO3": {
		"nom": "L-Tyrosine",
		"formule": "C9H11NO3",
		"elements": ["C", "C", "C", "C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 181.188 g/mol. Point de fusion : 343 °C (dec). Point d'ebullition : subl.",
		"geometrieVSEPR": ""
	},
 
	"C3H7NO2S": {
		"nom": "L-Cysteine",
		"formule": "C3H7NO2S",
		"elements": ["C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O", "S"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 121.159 g/mol. Point de fusion : 240 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C6H13NO2_isoleucine": {
		"nom": "L-Isoleucine",
		"formule": "C6H13NO2",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 131.173 g/mol. Point de fusion : 284 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C5H9NO2": {
		"nom": "L-Proline",
		"formule": "C5H9NO2",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 115.131 g/mol. Point de fusion : 221 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C5H11NO2": {
		"nom": "L-Valine",
		"formule": "C5H11NO2",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "N", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 117.147 g/mol. Point de fusion : 315 °C. Point d'ebullition : subl.",
		"geometrieVSEPR": ""
	},
 
	"C6H8O7": {
		"nom": "Acide citrique",
		"formule": "C6H8O7",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "O", "O", "O", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 192.124 g/mol. Point de fusion : 153 °C. Point d'ebullition : dec.",
		"geometrieVSEPR": ""
	},
 
	"C6H8O7_iso": {
		"nom": "Acide isocitrique",
		"formule": "C6H8O7",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "O", "O", "O", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 192.124 g/mol. Point de fusion : 105 °C.",
		"geometrieVSEPR": ""
	},
 
	"C4H6O4": {
		"nom": "Acide succinique",
		"formule": "C4H6O4",
		"elements": ["C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 118.089 g/mol. Point de fusion : 185 °C. Point d'ebullition : 234 °C.",
		"geometrieVSEPR": ""
	},
 
	"C4H4O4": {
		"nom": "Acide fumarique",
		"formule": "C4H4O4",
		"elements": ["C", "C", "C", "C", "H", "H", "H", "H", "O", "O", "O", "O"],
		"liaisons": ["DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE"],
		"proprietes": "Masse molaire : 116.073 g/mol. Point de fusion : 289.4 °C. Point d'ebullition : 165 °C subl.",
		"geometrieVSEPR": ""
	},
 
	"C4H6O5": {
		"nom": "Acide malique",
		"formule": "C4H6O5",
		"elements": ["C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "O", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE"],
		"proprietes": "Masse molaire : 134.088 g/mol. Point de fusion : 132 °C.",
		"geometrieVSEPR": ""
	},
 
	"C4H4O5": {
		"nom": "Acide oxaloacetique",
		"formule": "C4H4O5",
		"elements": ["C", "C", "C", "C", "H", "H", "H", "H", "O", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "DOUBLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE", "DOUBLE", "SIMPLE", "DOUBLE"],
		"proprietes": "Masse molaire : 132.072 g/mol. Point de fusion : 161 °C (dec).",
		"geometrieVSEPR": ""
	},
 
	"C5H10O5": {
		"nom": "D-Ribose",
		"formule": "C5H10O5",
		"elements": ["C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "O", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE"],
		"proprietes": "Masse molaire : 150.130 g/mol. Point de fusion : 88 °C.",
		"geometrieVSEPR": ""
	},
 
	"C6H12O6_galactose": {
		"nom": "D-Galactose",
		"formule": "C6H12O6",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "O", "O", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE"],
		"proprietes": "Masse molaire : 180.155 g/mol. Point de fusion : 170 °C.",
		"geometrieVSEPR": ""
	},
 
	"C6H12O6_mannose": {
		"nom": "D-Mannose",
		"formule": "C6H12O6",
		"elements": ["C", "C", "C", "C", "C", "C", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "H", "O", "O", "O", "O", "O", "O"],
		"liaisons": ["SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "SIMPLE", "DOUBLE"],
		"proprietes": "Masse molaire : 180.155 g/mol. Point de fusion : 118 °C.",
		"geometrieVSEPR": ""
	}
}
