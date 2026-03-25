class_name Liaison extends Node 

var type_liaison := 0
var atome1 := Element
var atome2 := Element


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
var code_liaison: Dictionary = {
	"CCSIMPLE": "CHs",
	"CHSIMPLE": "CHs",
	"CNSIMPLE": "CNs",
	"COSIMPLE": "COs",
	"CSSIMPLE": "CSs",
	"HHSIMPLE": "HHs",
	"HNSIMPLE": "HNs",
	"HOSIMPLE": "HOs",
	"HSSIMPLE": "HSs",
	"NNSIMPLE": "NNs",
	"NSSIMPLE": "NSs",
	"ONSIMPLE": "ONs",
	"OOSIMPLE": "OOs",
	"OSSIMPLE": "OSs",
	"SSSIMPLE": "SSs",
	#
	"CCDOUBLE": "CCd",
	"CHDOUBLE": "CHd",
	"CNDOUBLE": "CNd",
	"CODOUBLE": "COd",
	"CSDOUBLE": "CSd",
	"HHDOUBLE": "HHd",
	"HNDOUBLE": "HNd",
	"HODOUBLE": "HOd",
	"HSDOUBLE": "HSd",
	"NNDOUBLE": "NNd",
	"NSDOUBLE": "NSd",
	"ONDOUBLE": "ONd",
	"OODOUBLE": "OOd",
	"OSDOUBLE": "OSd",
	"SSDOUBLE": "SSd",
	#
	"CCTRIPLE": "CCt",
	"CHTRIPLE": "CHt",
	"CNTRIPLE": "CNt",
	"COTRIPLE": "COt",
	"CSTRIPLE": "CSt",
	"HHTRIPLE": "HHt",
	"HNTRIPLE": "HNt",
	"HOTRIPLE": "HOt",
	"HSTRIPLE": "HSt",
	"NNTRIPLE": "NNt",
	"NSTRIPLE": "NSt",
	"ONTRIPLE": "ONt",
	"OOTRIPLE": "OOt",
	"OSTRIPLE": "OSt",
	"SSTRIPLE": "SSt",
}
