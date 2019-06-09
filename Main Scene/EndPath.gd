extends Area2D

func _on_EndPath_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		area.get_parent().queue_free()