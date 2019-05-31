extends Area2D

var enemy_slow = []
var enemies_affected = 3
var count = 0

func _ready():
	
	self.global_position = self.get_global_mouse_position()
	
func _on_Area2D_area_entered(area):
	
	if count ==enemies_affected:
		
		return
	
	if area.get_parent().is_in_group(Groups.Enemies):
		if count ==0:
			$AnimatedSprite.play()
			
		enemy_slow.append(area.get_parent())
		area.get_parent().speed = area.get_parent().speed/2
	
		count+=1
		
	
func _on_Area2D_area_exited(area):
	
	if area.get_parent() in enemy_slow:
		area.get_parent().speed = area.get_parent().speed*2
		enemy_slow.erase(area.get_parent())
		
	if count ==enemies_affected and len(enemy_slow)==0:
		
		self.queue_free()
	
	

