tool
extends StaticBody2D

var default_sprite = preload('res://assets/unbreakable.png')
var breakable_sprite = preload('res://assets/breakable.png')

func _ready():
	refresh()
	
	# remove if you need _process outside the editor
	set_process(Engine.editor_hint)
	
func _process(_delta):
	# auto refresh stuff while in editor
	if Engine.editor_hint:
		refresh()
	
func refresh():
	if self.is_in_group('breakable'):
		$Sprite.texture = breakable_sprite
	else:
		$Sprite.texture = default_sprite
		
func toggle_breakable():
	if self.is_in_group('breakable'):
		self.remove_from_group('breakable')
	else:
		self.add_to_group('breakable')
	refresh()
