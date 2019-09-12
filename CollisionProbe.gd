extends Node

onready var host = get_parent()
export var manager_name = "CollisionManager"
var collision_manager

func _ready():
	# Generic way to get the manager. Maybe
	for manager in get_tree().get_nodes_in_group("managers"):
		if manager_name == manager.name:
			collision_manager = manager
			break
	
	if host is RigidBody2D:
		# automagic
		host.contact_monitor = true
		if host.contacts_reported <= 0:
			host.contacts_reported = 1
			
		host.connect('body_entered', collision_manager, '_on_collision_enter', [host])
		# connect('body_exited', collision_manager, '_on_collision_exit', [host])
		host.connect('body_shape_entered', collision_manager, '_on_collision_enter', [host])
		# connect('body_shape_exited', collision_manager, '_on_collision_exit', [host])
	elif host is Area2D:
		host.connect("area_entered", collision_manager, "_on_collision_enter", [host])
		host.connect("area_exited", collision_manager, "_on_collision_exited", [host])
		host.connect("body_entered", collision_manager, "_on_collision_enter", [host])
		host.connect("body_exited", collision_manager, "_on_collision_exited", [host])
