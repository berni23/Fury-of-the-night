extends PathFollow2D


var nuke = false


func _process(delta):

	if nuke ==true:
		if unit_offset < 0.98:
			self.unit_offset += delta/4
		else:
			
			get_parent().get_parent().get_node('AnimatedSprite').show()
			get_parent().get_parent().get_node('AnimatedSprite').play()
			get_parent().get_parent().Siren = false
			get_parent().get_parent().get_node('fiu').queue_free()
			self.queue_free()
			