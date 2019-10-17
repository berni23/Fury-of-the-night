extends PathFollow2D

export(int) var Speed = 100

var enemy =false
var enemy_list=[]
var reload =true


func _process(delta):
	
	if len(enemy_list)==0:
	
		self.offset+=Speed*delta
		
	elif reload ==true:
		
		enemy_list[0].get_node('HealthBar').value -= 1
		reload=false
		
func _on_Area2D_area_entered(area):
	
	if area.get_parent().is_in_group(Groups.Enemies):
		if len(enemy_list)==0:
			$AnimatedSprite.animation = "Attack"
			enemy_list.append(area.get_parent())
			$Timer.start()
			enemy_list[0].stop=true

func _on_Area2D_area_exited(area):
	
	if area.get_parent().is_in_group(Groups.Enemies):
		enemy_list.erase(area.get_parent())
		
	if len(enemy_list)==0:
		$AnimatedSprite.animation = "Walk"
		


func _on_Timer_timeout():
	
	reload = true
	

		