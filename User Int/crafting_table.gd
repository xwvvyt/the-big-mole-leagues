extends StaticBody2D


func _ready() -> void:
	modulate = Color(Color.DARK_GREEN,0.7)


func _process(delta: float) -> void:
	if Dragging.is_dragging:
		visible = true
	else:
		visible = false

		
