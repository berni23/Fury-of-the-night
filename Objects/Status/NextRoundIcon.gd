extends TextureButton

var done = false
var waitTime # Has to be set by the parent before _ready is called

signal next_round

func _ready():
	var sF = $AnimatedCountdown.get_sprite_frames()
	var base_fps = sF.get_animation_speed($AnimatedCountdown.get_animation())
	var frames = sF.get_frame_count($AnimatedCountdown.get_animation())
	# I want to spend waitTime seconds on the animation. So I need to set the fps to
	var fps = frames/float(waitTime)
	# And I multiply the base fps so that the total fps is the one I want
	$AnimatedCountdown.set_speed_scale(fps/base_fps)
	$AnimatedCountdown.play()

func next_round():
	# This check is to prevent from calling next_round on the parent 2 times, 
	# which could happen if click and animation finishing happens simultaneously
	if not done:
		emit_signal("next_round")
		done = true
	self.queue_free()

func _on_NextRoundIcon_pressed():
	self.next_round()

func _on_AnimatedCountdown_animation_finished():
	self.next_round()