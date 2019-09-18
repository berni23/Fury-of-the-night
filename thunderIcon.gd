extends Sprite

export (PackedScene) var Thunder

func _ready():
	
	self.global_position = self.get_global_mouse_position()	
	self.add_to_group(Groups.Icons)

func _process(delta):
	
	self.global_position = self.get_global_mouse_position()
	
func _input(event):
	
#	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT:
      
	if Input.is_action_just_pressed("right_click"):
	
		self.queue_free()
		
	if Input.is_action_just_pressed("left_click"):
			
#	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:	
	
		if get_parent().Thunders >= 1:

				var ThunderScene = Thunder.instance()
				get_parent().get_node("YSortObjects").add_child(ThunderScene)
				get_parent().add_Thunders(-1)
#				self.queue_free()
				
