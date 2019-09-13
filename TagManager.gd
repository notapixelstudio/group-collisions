extends Node

func have_tags(a, b, g1, g2) -> Array:
	# check if two objects a, b are in groups g1, g2 (unordered)
	# also returns the objects ordered by group
	var ret = []
	if has_tag(a, g1) and has_tag(b,g2):
		ret = [a, b]
	elif has_tag(a, g2) and has_tag(b, g1):
		ret = [b, a]
	return ret
	
func has_tag(what: Node, tag_name: String)-> bool:
	return what.is_in_group(tag_name)

func add_tag(what: Node, tag_name: String)-> void:
	what.add_to_group(tag_name)
	if what.has_method('_on_tag_added'):
		what._on_tag_added(tag_name)

func remove_tag(what: Node, tag_name: String)-> bool:
	if what.is_in_group(tag_name):
		what.remove_from_group(tag_name)
		if what.has_method('_on_tag_removed'):
			what._on_tag_removed(tag_name)
		return true
	return false