extends Area2D

func _on_EndPath_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		area.get_parent().queue_free()
		$"..".add([-4,"life"]) 
	get_parent().get_node('RoundManager').j=false
		# De moment tothom fa 1 de mal. Mes endavant cada enemic tindra
		# un valor de damage different...
		# $".." es el node just a sobre o sigui get_parent()