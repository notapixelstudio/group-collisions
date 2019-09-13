extends Node2D

	
func _on_collision_enter(a, b):
	# breaker, breakable
	print("collision detected from ", a.name)
	var result = []
	result = TAG.have_tags(a, b, "breaker", "breakable")
	if result:
		on_breaker_breakable_collision(result[0], result[1])


func on_breaker_breakable_collision(a, b):
	print(a.name)
	print(b.name)