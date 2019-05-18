extends Area2D

func _on_EndPath_area_entered(enemy):
	
	""" Function que elimina els enemics si 
	finalitzen el recorregut"""
	
	if enemy.is_in_group(Groups.Enemies):
		enemy.get_parent().queue_free()