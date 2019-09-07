extends Area2D

var Mud = preload('res://Objects/Traps/Mud.tscn')
var path

func _ready():
	self.add_to_group(Groups.Icons)
	path = get_parent().get_node("Path2D")

func _process(delta):
	# Follow the mouse snapping to grid
	position = CustomFunc.snap_to_grid(get_global_mouse_position(),
									Vector2(32,32),Vector2(16,16))
	
func _input(event):
	if Input.is_action_just_pressed("right_click"):
		self.queue_free()
			
	if Input.is_action_just_pressed("left_click"):
		# If it is far form the path, don't do anything
		if CustomFunc.distance_to_path(position,path) > 0:
			return
		# Else, create a Mud instance at current position and disappear
		var MudScene = Mud.instance()
		get_parent().get_node("YSortObjects").add_child(MudScene)
		MudScene.global_position = self.global_position
#		self.queue_free()