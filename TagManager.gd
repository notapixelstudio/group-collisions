extends Node

func have_tags(a, b, g1, g2) -> Array:
	# check if two objects a, b are in groups g1, g2 (unordered)
	# also returns the objects ordered by group
	var ret = []
	if a.is_in_group(g1) and b.is_in_group(g2):
		ret = [a, b]
	elif a.is_in_group(g2) and b.is_in_group(g1):
		ret = [b, a]
	return ret
	
func has_tag(what:Node, tag_name: String)-> bool:
	return false

func add_tag(what: Node, tag_name: String)-> void:
	return

func remove_tag(what: Node, tag_name: String)-> void:
	return