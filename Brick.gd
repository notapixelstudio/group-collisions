extends StaticBody2D

var default_sprite = preload('res://assets/unbreakable.png')
var breakable_sprite = preload('res://assets/breakable.png')

func _on_tag_added(tag):
	if TAG.has_tag(self, 'breakable'):
		$Sprite.texture = breakable_sprite
		
func _on_tag_removed(tag):
	if not (TAG.has_tag(self, 'breakable')):
		$Sprite.texture = default_sprite
		
func toggle_breakable():
	if TAG.has_tag(self, 'breakable'):
		TAG.remove_tag(self, 'breakable')
	else:
		TAG.add_tag(self, 'breakable')
		