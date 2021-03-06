extends Path2D

export (float) var animation_seconds = 1
var damage =10
var explosion_range = []

func _ready():
	get_tree().get_root().get_node("GameMaster/Chakra").item_used("Bomb")
	self.global_position = self.get_global_mouse_position()
	self.get_node("PathFollow2D/Area2D/AnimatedSprite").play()
	add_to_group(Groups.Projectiles)
	
func _on_TimerAudio_timeout():
	self.get_node('AudioStreamPlayer2D').play()
	
func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies) or area.get_parent().is_in_group(Groups.Friends):
		explosion_range.append(area.get_parent())

func _on_Area2D_area_exited(area):
	if area.get_parent().is_in_group(Groups.Enemies) or area.get_parent().is_in_group(Groups.Friends):
		explosion_range.erase(area.get_parent())

func _on_TimerExplosion_timeout():
	for enemy in explosion_range:
		enemy.get_node('HealthBar').value -= self.damage

func _on_AnimatedSprite_animation_finished():
	self.queue_free()
