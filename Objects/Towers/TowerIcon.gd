extends Area2D

var grid
var can_build = false
export (PackedScene) var towerScene

func _ready():
	add_to_group(Groups.Icons)
	able_to_build(false)
	grid = get_tree().get_root().get_node("GameMaster/Pathway")
	
func _process(delta):
	# Follow the mouse snapping to grid
	position = get_global_mouse_position().snapped(Vector2(32,32))
	
func _input(event):
	if Input.is_action_pressed("left_click"):
		if not can_build:
			return
		if get_parent().Coins >=2:
		# Else, create a new tower
			var NewTower = towerScene.instance()
			NewTower.global_position = global_position
			get_parent().get_node("YSortObjects").add_child(NewTower)
			# aditionally, one should delete the tower spot
			for spot in get_parent().get_node("TowerSpots").get_children():
				if (spot.global_position-self.global_position).length()<1:
					spot.queue_free(); break
		
			get_parent().add_Coins(-2)
			#self.queue_free()
		
	elif Input.is_action_pressed("right_click"):
		self.queue_free()

func able_to_build(flag):
	if flag:
		$Sprite.self_modulate = MyColors.TowerGreen
		can_build = true
	else:
		$Sprite.self_modulate = MyColors.TowerRed
		can_build = false
