extends Area2D

var ShowMagnet = true
#func _ready():

func _on_Area2D_area_entered(area):
	if area.is_in_group(Groups.Hover):
		if ShowMagnet ==true:
			$tirori.play()
			ShowMagnet =false
			$MagnetSprite.hide()


func _on_tirori_finished():
	self.get_parent().get_parent().Magnet_on()
	self.queue_free()
	
func _on_Timer_timeout():
	 $MagnetSprite.animation ="default2"

func _on_Timer2_timeout():
	self.queue_free()