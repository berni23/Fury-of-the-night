extends Area2D

var sound_coin = AudioStreamPlayer2D.new()

func _ready():
	
	self.add_child(sound_coin)
	sound_coin.stream = preload("res://Assets/Sounds/sound_coin.wav")
	self.add_to_group(Groups.Icons)

func _process(delta):
	
	self.global_position=get_global_mouse_position()

func _input(event):
	
	if Input.is_action_pressed("right_click"):
	
			self.queue_free()
	
func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Money"):
		
		sound_coin.play()
		area.queue_free()
		self.get_parent().add_Coins(1)
