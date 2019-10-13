extends Node2D

var damage = 10

func _ready():
	
	add_to_group(Groups.Projectiles)
	self.position = self.get_global_mouse_position()	
	self.get_node('BAaang').play()

func _on_AnimatedSprite_animation_finished():
	
	self.get_node('AnimatedSprite').queue_free()

func _on_Area2D_area_entered(area):
	
	if area.get_parent().is_in_group(Groups.Enemies):
		area.get_parent().get_node('HealthBar').value -= self.damage
	

func _on_BAaang_finished():
 	self.queue_free()