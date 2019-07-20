extends Node

var watches = []

# check if two objects a, b are in groups g1, g2 (unordered)
# also returns the objects ordered by group
func in_groups(a, b, g1, g2):
	if a.is_in_group(g1) and b.is_in_group(g2):
		return {'matches': true, 'entities': [a, b]}
	if a.is_in_group(g2) and b.is_in_group(g1):
		return {'matches': true, 'entities': [b, a]}
	return {'matches': false}
	
func _on_collision_enter(a, b):
	for watch in watches:
		var result = in_groups(a, b, watch.g1, watch.g2)
		if result.matches:
			watch.target.call(watch.method, result.entities[0], result.entities[1])
		
func connect_group_collision(g1, g2, target, method):
	watches.append({'g1': g1, 'g2': g2, 'target': target, 'method': method})
	
# TBD OOP-style matches, and hybrid OOP-groups