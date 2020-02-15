extends Area2D

var enemy_in = []
var anim1 = true
var first = false
var enemy_past =0


func _ready():
	self.add_to_group(Groups.Shred)
	get_tree().get_root().get_node("GameMaster/Chakra").item_used("Shred")

func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Fly):
		return
	elif area.get_parent().is_in_group(Groups.Enemies):
		enemy_in.append(area.get_parent())
		
		if enemy_past ==0:
			$AnimatedSprite.play()
			self.get_node("AudioStreamPlayer2D").play()
		
		if first==false:
			$turn_damage.start()
			$finish.start()
			first =true
			
func _on_Area2D_area_exited(area):
		enemy_in.erase(area.get_parent())
		if len(enemy_in)==0 and anim1==false:
			enemy_past = 0
			$AnimatedSprite.stop()
			self.get_node("AudioStreamPlayer2D").stop()
		
func _on_AnimatedSprite_animation_finished():
	if anim1==true:
		$AnimatedSprite.animation = "turbo_mix"
		anim1=false
			
func _on_finish_timeout():
	 #$AnimatedSprite.animation = "setting_up"
	 #averiguar com posar una animació enrere
	 self.queue_free()
	
func _on_turn_damage_timeout():
	for enemy in enemy_in:
		enemy.get_node('HealthBar').value -= 1 
		

