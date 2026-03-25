extends TextureRect


var nbHydrogene : int = 0
var nbCarbon : int = 0
var nbAzote : int = 0
var nbOxygene : int = 0
var nbAtome : int = 0


func _get_drag_data(at_position):
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	
	return texture

func _can_drop_data(_pos , data):
	return data is Texture2D

func _drop_data(_pos , data):
	nbAtome += 1
	print(str(nbAtome))
	NbAtomes.text = "NbAtomes:" + str(nbAtome)
	
	texture = data
