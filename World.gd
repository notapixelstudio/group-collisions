extends Node2D

	
func _on_collision_enter(a, b):
	print("Enter collision detected between ", a.name, " and ", b.name)
	
	# breaker, breakable
	var result = TAG.have_tags(a, b, "breaker", "breakable")
	if result:
		print(result[0].name, " breaks ", result[1].name)
		result[1].queue_free()

func _on_collision_exit(a, b):
	print("Exit collision detected between ", a.name, " and ", b.name)
	