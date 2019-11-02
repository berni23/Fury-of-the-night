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
	

#func _on_Area2D_Magnet_on():
#	self.get_parent().get_parent().Magnet=true
#	self.queue_free()
	
