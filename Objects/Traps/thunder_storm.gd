extends Node2D

var damage = 10
var cloud = false
var c = 0
func _ready():
	
	add_to_group(Groups.Projectiles)
	self.position = self.get_global_mouse_position()	
	#self.get_node('BAaang').play()


func _process(delta):
	
	if cloud==false:
		c+=0.15*delta
		$Sprite.modulate = Color(1-c,1-c,1-c,2*c)
	
	
#func _on_AnimatedSprite_animation_finished():	
#	self.queue_free()
#	self.get_node('AnimatedSprite').queue_free()

func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		area.get_parent().get_node('HealthBar').value -= self.damage
	

func _on_BAaang_finished():
 	self.queue_free()

func _on_Timer_timeout():
	cloud =true
	$BAaang.play()
	$AnimatedSprite.show()
	$AnimatedSprite.play()
	$Area2D/CollisionShape2D.disabled = false
	