#extends "res://Scripts/ShootIcon.gd"

extends Sprite

var Shoot = preload('res://Objects/Traps/Bomb/BombBasic.tscn')


func _ready():
	
	self.global_position = self.get_global_mouse_position()
	self.add_to_group(Groups.Icons)
	

func _process(delta):
	
	self.global_position = self.get_global_mouse_position()
	
func _input(event):
	  
	if Input.is_action_just_pressed("right_click"):
	
		self.queue_free()
		
	if Input.is_action_just_pressed("left_click"):

		if self.get_parent().Bomb > 0:

				var Scene = Shoot.instance()
				get_parent().get_node("YSortObjects").add_child(Scene)
				get_parent().add_Bomb(-1)
#				self.queue_free()

