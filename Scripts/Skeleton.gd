extends "res://Scripts/Enemy.gd"


func _on_Area2D_area_entered(area):

	
	if area.get("damage"):
		HP = HP - area.damage
		if HP <=0:
			self.queue_free()
			
		area.queue_free()
		
