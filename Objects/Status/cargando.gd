extends AnimatedSprite

var waitTime = 7  # In seconds

func _ready():
	# Set position in center of parent
	self.playing = true
	self.scale =Vector2(0.4,0.4)
	self.position =Vector2(get_parent().margin_right/2,get_parent().margin_bottom/2)
	# Set Animation time
	var sF = self.get_sprite_frames()
	var base_fps = sF.get_animation_speed(self.get_animation())
	var frames = sF.get_frame_count(self.get_animation())
	# I want to spend waitTime seconds on the animation. So I need to set the fps to
	var fps = frames/float(waitTime)
	# And I multiply the base fps so that the total fps is the one I want
	self.set_speed_scale(fps/base_fps)

func _on_Cargando_animation_finished():
	self.queue_free()