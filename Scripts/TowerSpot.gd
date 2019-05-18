extends Area2D

func _on_TowerSpot_area_entered(area):
	area.able_to_build(true)

func _on_TowerSpot_area_exited(area):
	area.able_to_build(false)
