extends RigidBody2D

signal collision_enter

func _ready():
	connect('body_entered', self, '_on_body_entered')
	
func _on_body_entered(body):
	emit_signal("collision_enter", body, self)
	