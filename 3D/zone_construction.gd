extends Node3D
class_name ZoneConstruction3D

@export var atome_scene: PackedScene
@export var liaison_scene: PackedScene

# Atomes déposés (pas encore en molécule)
var atomes_en_attente: Array[Atome] = []
# Compteur de composition {"H": 2, "O": 1}
var composition: Dictionary = {}

signal molecule_creee(nom: String)
signal erreur_composition

# ── Appelé par la palette de ta coéquipière ──────────────────────────
func deposer_atome(element: String) -> void:
	var atome = atome_scene.instantiate() as Atome
	add_child(atome)
	atome.setup(element)

	# Positionne les atomes en file horizontale temporaire
	var x = atomes_en_attente.size() * 1.5
	atome.position = Vector3(x, 0.0, 0.0)
	atomes_en_attente.append(atome)
	composition[element] = composition.get(element, 0) + 1

# ── Bouton "Créer" ────────────────────────────────────────────────────
func sur_bouton_creer() -> void:
	var data = Validateur.trouver_molecule(composition)

	if data == null:
		erreur_composition.emit()  # Main affiche le message d'erreur
		return
		_effacer_atomes_en_attente()
		_construire_molecule(data)
		molecule_creee.emit(data["nom"])

# ── Construction visuelle finale ──────────────────────────────────────
func _construire_molecule(data: Dictionary) -> void:
	var noeuds_atomes = []
	for info in data["atomes"]:
		var atome = atome_scene.instantiate() as Atome
		add_child(atome)
		atome.setup(info["element"])
		atome.position = info["pos"]
		noeuds_atomes.append(atome)
	for lien in data["liaisons"]:
		var liaison = liaison_scene.instantiate() as Liaison
		add_child(liaison)
		liaison.setup(noeuds_atomes[lien[0]], noeuds_atomes[lien[1]])#── Nettoyage ─────────────────────────────────────────────────────────
func _effacer_atomes_en_attente() -> void:    
	for a in atomes_en_attente:        
		a.queue_free()    
	atomes_en_attente.clear()
	composition.clear()

func reset() -> void:
	_effacer_atomes_en_attente()
	for enfant in get_children():
		enfant.queue_free()
