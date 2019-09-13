extends Node

onready var host = get_parent()

func _ready():
	
	# Generic way to get the manager. Maybe
	for collision_manager in get_tree().get_nodes_in_group("collision_managers"):

		if host is RigidBody2D:
			print("I am a Rigid, Getting ready for ", host.name)
			# automagic
			host.contact_monitor = true
			if host.contacts_reported <= 0:
				host.contacts_reported = 1
				
			host.connect('body_entered', collision_manager, '_on_collision_enter', [host])
			# connect('body_exited', collision_manager, '_on_collision_exit', [host])
		elif host is Area2D:
			print("I am an area, Getting ready for ", host.name)
			host.connect("area_entered", collision_manager, "_on_collision_enter", [host])
			host.connect("area_exited", collision_manager, "_on_collision_exited", [host])
			host.connect("body_entered", collision_manager, "_on_collision_enter", [host])
			host.connect("body_exited", collision_manager, "_on_collision_exited", [host])
