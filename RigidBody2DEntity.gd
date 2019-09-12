extends RigidBody2D

signal collision_enter
export var cm_node_path : NodePath 
onready var collision_manager = set_collision_manager(cm_node_path)

func set_collision_manager(node_path: NodePath):
	return get_node(node_path)
	
func _ready():
	connect('body_entered', collision_manager, '_on_collision_enter', [self])
	# connect('body_exited', collision_manager, '_on_collision_exit', [self])
	connect('body_shape_entered', collision_manager, '_on_collision_enter', [self])
	# connect('body_shape_exited', collision_manager, '_on_collision_exit', [self])
	
	
	
	