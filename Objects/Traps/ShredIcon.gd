extends Sprite

export (PackedScene) var Scene

var path
var shredCounter=0
func _ready():
	self.add_to_group(Groups.Icons)
	path = get_parent().get_node("Path2D")

func _process(delta):
	position = CustomFunc.snap_to_grid(get_global_mouse_position(),Vector2(32,32),Vector2(16,16))
	
func _input(event):
	if Input.is_action_just_pressed("right_click"):
		self.queue_free()
	if Input.is_action_just_pressed("left_click"):
		if self.get_parent().Shred>0:
		# If it is far form the path, don't do anything
			if CustomFunc.distance_to_path(position,path) > 1:
				return

			elif shredCounter==0:
				var ShredScene = Scene.instance()
				get_parent().get_node("YSortObjects").add_child(ShredScene)
				ShredScene.global_position = self.global_position
				get_parent().add_Shred(-1)

func _on_Area2D_area_entered(area):
	if area.is_in_group(Groups.Shred):
		shredCounter+=1
func _on_Area2D_area_exited(area):
	if area.is_in_group(Groups.Shred):
		shredCounter-=1
		
		
		
		