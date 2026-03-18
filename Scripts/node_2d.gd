extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

enum liaisons {SIMPLE, DOUBLE, TRIPLE, COIN, TIRET}
func _init():
	print("Hello, world!")
	print("Hit the SLAY button!")
	print(liaisons.keys())
	print(liaisons.values())
