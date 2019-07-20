extends Node

var host

func _ready():
	host = get_parent()
	
	if host is RigidBody2D:
		# automagic
		host.contact_monitor = true
		if host.contacts_reported <= 0:
			host.contacts_reported = 1
			
		host.connect("body_entered", self, "_on_body_entered")
		
func _on_body_entered(body):
	get_tree().emit_signal("collision")
	