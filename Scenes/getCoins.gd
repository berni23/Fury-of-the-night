extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


	
var sound_coin = AudioStreamPlayer2D.new()

func _ready():
	self.add_child(sound_coin)
	sound_coin.stream = preload ("res://sound_coin.wav")

func _process(delta):
	
	self.global_position=get_global_mouse_position()

func _input(event):
	
	if Input.is_action_pressed("right_click"):
	
			self.queue_free()
	
func _on_Area2D_area_entered(area):
	
	if area.is_in_group("Money"):
		
		sound_coin.play()
		area.queue_free()
		self.get_parent().get_node("Control").NumCoins +=1
	
	
	
