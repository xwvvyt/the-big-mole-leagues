extends ItemList

# icones des éléments
var blue = load("res://blue_krebs.png")
var green = load("res://green_krebs.png")
var red = load("res://red_krebs.png")
var pink = load("res://pink_krebs.png")
var yellow = load("res://yellow_krebs.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_fixed_icon_size(Vector2(32, 32))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _rajouter_item() -> void:
	clear()
	var icon : Texture2D
	for id in Inventaire.inventaire:
		if Inventaire.inventaire[id]["symbole"] == "H":
			icon = blue
		elif Inventaire.inventaire[id]["symbole"] == "O":
			icon = green
		elif Inventaire.inventaire[id]["symbole"] == "C":
			icon = yellow
		elif Inventaire.inventaire[id]["symbole"] == "N":
			icon = red
		elif Inventaire.inventaire[id]["symbole"] == "S":
			icon = pink
			
		add_item(Inventaire.inventaire[id]["type"], icon, true)
		set_item_metadata(get_item_count() - 1, id)
