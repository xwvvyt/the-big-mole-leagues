extends MeshInstance3D
class_name Liaison3D
var atome_a : Atome3D = null
var atome_b : Atome3D = null


# Cette fonction va placer et étirer le bâton entre deux points
func relier(point_a: Vector3, point_b: Vector3):
	# 1. Positionner le bâton exactement au milieu des deux atomes
	global_position = (point_a + point_b) / 2.0
	var direction = (point_b-point_a).normalized()
	var up = Vector3.UP
	if abs(direction.dot(Vector3.UP))>0.99:
		up=Vector3.FORWARD
	
	look_at(point_b,up)
	rotate_object_local(Vector3.RIGHT, deg_to_rad(90))
	
	# 4. Ajuster la longueur
	var distance = point_a.distance_to(point_b)
	scale = Vector3(scale.x,distance,scale.y)
	
	
func setup(a:Atome3D, b: Atome3D) -> void:
	atome_a = a
	atome_b = b
	_appliquer_style()
	relier(a.global_position, b.global_position)
	
func _process(_delta : float)-> void:
	if atome_a and atome_b:
		relier(atome_a.global_position,atome_b.global_position)
	
func _appliquer_style() -> void :
	var mat = StandardMaterial3D.new()
	mat.albedo_color = Color(0.7, 0.7, 0.7)  # Gris neutre
	mat.roughness = 0.4
	mat.metallic = 0.2
	set_surface_override_material(0, mat)
