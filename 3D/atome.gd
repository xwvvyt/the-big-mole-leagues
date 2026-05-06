extends Area3D
class_name Atome3D

# caractéristiques de base. Par défaut, c'est un Carbone (C) Noir, mais ces valeurs seront écrasées dès qu'on créera l'atome.
var type_element : String = "C"
var couleur : Color = Color.BLACK
var rayon: float=1.0

const ELEMENTS = {
	"H":  { "couleur": Color.WHITE,                "rayon": 0.53 },
	"C":  { "couleur": Color(0.2, 0.2, 0.2),       "rayon": 0.77 },
	"N":  { "couleur": Color(0.2, 0.2, 1.0),       "rayon": 0.75 },
	"O":  { "couleur": Color(1.0, 0.2, 0.2),       "rayon": 0.73 },
	"S":  { "couleur": Color(1.0, 0.9, 0.0),       "rayon": 1.02 },
}


func setup(element: String)-> void:
	type_element = element
	
	var props =ELEMENTS.get(element,{"couleur": Color.MAGENTA, "rayon": 0.8})
	couleur = props["couleur"]
	rayon = props["rayon"]
	
	_appliquer_visuel()
	
func _appliquer_visuel() -> void:
	var mesh_node = $MeshInstance3D 
	
	mesh_node.scale = Vector3.ONE* rayon
	
	# On crée un matériau unique (sinon tous les atomes changent de couleur en même temps)
	var mat = StandardMaterial3D.new()
	mat.albedo_color = couleur
	mat.roughness = 0.2 
	mat.metallic = 0.1
	
	#effets pour la scene 3D
	mat.emission_enabled = true
	mat.emission = couleur * 0.15
	mat.emission_energy_multiplier = 0.5
	
	mesh_node.set_surface_override_material(0, mat)
	# credit : gemini et claude
