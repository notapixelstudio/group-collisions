extends Node2D

func _on_collision_enter(a, b):
	print("Enter collision detected between ", a.name, " and ", b.name)
	
	# power up!
	if a is Hero and b is Mushroom:
		a.power_up()
		b.queue_free()
		
	# break stuff!
	if a.is_in_group('breakable') and b.is_in_group('breaker'): # TBD order matters!
		print(a.name, " broken by ", b.name)
		a.queue_free()

func _on_collision_exit(a, b):
	print("Exit collision detected between ", a.name, " and ", b.name)
	
