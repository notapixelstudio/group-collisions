extends Node

func _ready():
	for child in get_children():
		TAG.add_tag(get_parent(), child.name)
	queue_free()
	