extends Area2D

var sound_coin = AudioStreamPlayer2D.new()

func _ready():
	

	self.add_to_group(Groups.Icons)
	self.add_to_group(Groups.Hover)

func _process(delta):
	
	self.global_position=get_global_mouse_position()

func _input(event):
	
	if Input.is_action_pressed("right_click"):
	
			self.queue_free()
	

