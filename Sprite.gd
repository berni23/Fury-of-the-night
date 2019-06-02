extends Sprite

var Mud = preload('res://Scenes/Mud.tscn')

func _ready():
	
	self.add_to_group(Groups.Icons)
	

func _process(delta):
	
	
	self.position = self.get_global_mouse_position()
	

func _input(event):
	
		if Input.is_action_pressed("right_click"):
	
			self.queue_free()
			
		if Input.is_action_pressed("left_click"):
			
			
				var MudScene = Mud.instance()
				get_parent().get_node("Towers").add_child(MudScene)
				self.queue_free()
			