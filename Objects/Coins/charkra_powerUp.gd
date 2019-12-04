extends Node2D


func _ready():
	self.global_position = Vector2(898,546)

func _on_ChakraPowerUp_area_entered(area):
	if area.is_in_group(Groups.Hover):
		get_tree().get_root().get_node("GameMaster").add_Chakra(1)
		$cling.play()
		$AnimatedSprite.hide()
		
func _on_cling_finished():
	self.queue_free()
