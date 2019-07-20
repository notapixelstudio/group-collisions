extends Node2D

func _ready():
	$CollisionManager.connect_group_collision('breaker', 'breakable', self, '_on_breaker_breakable_collision')
	
func _on_breaker_breakable_collision(breaker, breakable):
	breakable.queue_free()
	