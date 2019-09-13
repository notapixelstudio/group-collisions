extends RigidBody2D

var SPEED = 90

func _process(delta):
	apply_central_impulse(SPEED*Vector2(int(Input.is_action_pressed('ui_right')) - int(Input.is_action_pressed('ui_left')), int(Input.is_action_pressed('ui_down')) - int(Input.is_action_pressed('ui_up'))))