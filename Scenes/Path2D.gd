extends Path2D

var damage =10

var explosion_range = []

func _ready():
	
	self.global_position = self.get_global_mouse_position()
	self.get_node("PathFollow2D/Area2D/AnimatedSprite").play()

func _on_Timer_timeout():
	
	pass
	
#	var Size = self.get_node('PathFollow2D/Area2D/AnimatedSprite').get_scale()
#	self.get_node('PathFollow2D/Area2D/AnimatedSprite').scale =Size/2
	
func _on_TimerAudio_timeout():
	
	self.get_node('AudioStreamPlayer2D').play()
	
func _on_Area2D_area_entered(area):
	
	if area.get_parent().is_in_group(Groups.Enemies):
		explosion_range.append(area.get_parent())

func _on_Area2D_area_exited(area):
	
	print('Hey')
	
	if area.get_parent().is_in_group(Groups.Enemies):
		explosion_range.erase(area.get_parent())
		
func _on_AnimatedSprite_animation_finished():
	
	print(len(explosion_range))
	
	for enemy in explosion_range:
		
		
		enemy.HP = enemy.HP-self.damage
		
	self.queue_free()