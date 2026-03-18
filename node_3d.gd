@tool
@icon("res://554957532-dc72e5e6-46b2-4a15-b89d-489571058172 (1).png")
extends Node3D
class_name Atome 

# On définit une liste d'options fixes pour le type d'élément
enum EnumElementType { METAL, NON_METAL, METALLOID, HALOGENE }

@export_group("Données Atomiques")
@export var atomic_number: int = 1
@export var symbole_chimique : String = "H"
@export var element_type: EnumElementType = EnumElementType.NON_METAL
@export var atomic_radius: float = 1.0  

@export_group("Apparence")
@export var atom_color: Color = Color.WHITE

func _ready() -> void:
	setup_atom()

# Fonction pour appliquer les propriétés visuelles
func setup_atom() -> void:
	scale = Vector3.ONE * (atomic_radius * 0.1) 
	var mesh = get_node_or_null("MeshInstance3D")
	if mesh:
		var material = StandardMaterial3D.new()
		material.albedo_color = atom_color
		mesh.material_override = material

	print("Atome configuré : Numéro ", atomic_number, " | Type: ", EnumElementType.keys()[element_type] , "| Type:", symbole_chimique)
