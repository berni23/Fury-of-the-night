extends Sprite

var Shoot
var Thing

func _process(delta):
	
	self.global_position = self.get_global_mouse_position()
	
func _input(event):
	  
	if Input.is_action_just_pressed("right_click"):
	
		self.queue_free()
		
	if Input.is_action_just_pressed("left_click"):

		if Thing > 0:

				var Scene = Shoot.instance()
				get_parent().get_node("YSortObjects").add_child(Scene)
				get_parent().add(-1,Thing)
#				self.queue_free()