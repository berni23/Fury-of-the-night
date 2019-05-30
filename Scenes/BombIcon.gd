extends Sprite


var Bomb = preload('res://Scenes/BombBasic.tscn')

func _ready():
	
	self.add_to_group(Groups.Icons)

func _process(delta):
	
	self.global_position = self.get_global_mouse_position()
	

func _input(event):
	
		if Input.is_action_pressed("right_click"):
	
			self.queue_free()
			
		if Input.is_action_pressed("left_click"):

				var BombScene = Bomb.instance()
				get_parent().get_node("Towers").add_child(BombScene)
				self.queue_free()
			
			
