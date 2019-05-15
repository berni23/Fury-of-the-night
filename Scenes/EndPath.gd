extends Area2D


func _on_EndPath_area_entered(area):
	
	""" Function que elimina els enemics si 
	finalitzen el recorregut"""
	
	area.get_parent().queue_free()
