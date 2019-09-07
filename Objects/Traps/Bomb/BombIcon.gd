extends Sprite

var Bomb = preload('res://Objects/Traps/Bomb/BombBasic.tscn')

func _ready():
	
	self.add_to_group(Groups.Icons)

func _process(delta):
	
	self.global_position = self.get_global_mouse_position()
	
func _input(event):
	
#	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
      
	if Input.is_action_just_pressed("right_click"):
	
		self.queue_free()
		
	if Input.is_action_just_pressed("left_click"):
			
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:	
	
		if get_parent().Bombs >= 1:

				var BombScene = Bomb.instance()
				get_parent().get_node("YSortObjects").add_child(BombScene)
				get_parent().add_Bombs(-1)
#				self.queue_free()
				
			
			
			
