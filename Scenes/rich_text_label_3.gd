extends RichTextLabel

var statement: String

func _process(delta):
	
	statement += Node2D._on_item_list_item_clicked.declaration
	self.text = statement
	statement = ""
