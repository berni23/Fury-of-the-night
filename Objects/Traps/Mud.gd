extends Area2D

var enemy_slow = []
var enemies_affected = 3
var count = 0

func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Fly):
		return
		
	elif count ==enemies_affected:
		
		return

	elif area.get_parent().is_in_group(Groups.Enemies):
		if count ==0:
			$AnimatedSprite.play()
			
		enemy_slow.append(area.get_parent())
		print(len(enemy_slow))
		self.get_node("AudioStreamPlayer2D").play()
		area.get_parent().speed = area.get_parent().speed/2
	
		count+=1
		
func _on_Area2D_area_exited(area):
	
	
	if area.get_parent() in enemy_slow:
		area.get_parent().speed = area.get_parent().speed*2
		enemy_slow.erase(area.get_parent())
		
	print(len(enemy_slow))	
	
	if len(enemy_slow)==0:
		
		$AnimatedSprite.stop()
		
		if count ==enemies_affected :
		
			self.queue_free()
	
	

