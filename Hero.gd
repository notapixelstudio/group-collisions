tool
extends RigidBody2D

class_name Hero

var SPEED = 90

func _ready():
	refresh()

func _process(_delta):
	# auto refresh stuff while in editor
	if Engine.editor_hint:
		refresh()
		
	apply_central_impulse(SPEED*Vector2(int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left')), int(Input.is_action_pressed('ui_down')) - int(Input.is_action_pressed('ui_up'))))

func refresh():
	if self.is_in_group('breaker'):
		$Sprite.scale = Vector2(1,1)
	else:
		$Sprite.scale = Vector2(0.5,0.5)
	$CollisionShape2D.scale = $Sprite.scale
	
func power_up():
	add_to_group('breaker')
	refresh()
	
