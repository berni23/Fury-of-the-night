extends AnimatedSprite

func _ready():
	self.playing = true
	self.scale =Vector2(0.4,0.4)
	self.position =Vector2(get_parent().margin_right/2,get_parent().margin_bottom/2)

func _on_Cargando_animation_finished():
	self.queue_free()
