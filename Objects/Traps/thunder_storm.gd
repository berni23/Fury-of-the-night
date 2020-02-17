extends Node2D

var damage = 10
var enemy_list = []
var broken_list =[]
var cloud = false
var c = 0
func _ready():

	get_tree().get_root().get_node("GameMaster/Chakra").item_used("Thunder")
	self.position = self.get_global_mouse_position()

func _process(delta):
	if cloud==false:
		c+=0.15*delta
		$Sprite.modulate = Color(1-c,1-c,1-c,2*c)

func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies) or area.get_parent().is_in_group(Groups.Friends) :
		enemy_list.append(area.get_parent())
	elif area.is_in_group(Groups.BrokenStuff):
		broken_list.append(area)
	
func _on_BAaang_finished():
 	self.queue_free()

func _on_Timer_timeout():
	cloud =true
	$BAaang.play()
	$AnimatedSprite.show()
	$AnimatedSprite.play()
	$AnimatedSprite/Area2D.show()
	$AnimatedSprite/Area2D/CollisionShape2D.show()
	
	for enemy in enemy_list:
		enemy.get_node('HealthBar').value -= self.damage
	
	for stuff in broken_list:
		stuff.brokenstuff()

func _on_Area2D_area_exited(area):
	if area.get_parent().is_in_group(Groups.Enemies) or area.get_parent().is_in_group(Groups.Friends):
		enemy_list.erase(area.get_parent())

