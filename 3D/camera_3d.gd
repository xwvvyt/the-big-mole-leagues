extends Camera3D


var distance: float = 4.0      # distance à la molécule
var sensibilite: float = 0.3   # vitesse de rotation
var vitesse_zoom: float = 1.0  # vitesse du zoom
var rotation_x: float = 0.0
var rotation_y: float = 0.0
var en_rotation: bool = false  # true seulement si clic droit enfoncé

func _input(event: InputEvent) -> void:
	# Clic droit enfoncé → active la rotation
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			en_rotation = event.pressed

	# Zoom avec la molette
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			distance = max(2.0, distance - vitesse_zoom)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			distance = min(20.0, distance + vitesse_zoom)

	# Rotation avec la souris (clic droit enfoncé)
	if event is InputEventMouseMotion and en_rotation:
		rotation_y -= event.relative.x * sensibilite
		rotation_x -= event.relative.y * sensibilite
		rotation_x = clamp(rotation_x, -89.0, 89.0)  # évite le flip

func _process(_delta: float) -> void:
	# Calcule la position de la caméra en sphérique
	var rad_x = deg_to_rad(rotation_x)
	var rad_y = deg_to_rad(rotation_y)

	position = Vector3(
		distance * cos(rad_x) * sin(rad_y),
		distance * sin(rad_x),
		distance * cos(rad_x) * cos(rad_y)
	)
	look_at(Vector3.ZERO, Vector3.UP)
