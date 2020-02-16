extends Area2D

var grid
var can_build = false
export (PackedScene) var towerScene
var towerPrice

func _ready():
	$Sprite.position.y = -40

func _process(delta):
	# Follow the mouse snapping to grid
	position = get_global_mouse_position().snapped(Vector2(32,32))
	
func _input(event):
	if Input.is_action_just_pressed("left_click"):
		if not can_build:
			return
		if get_parent().Coins >= towerPrice:
			# Pay the price
			get_parent().add_Coins(-towerPrice)
			# Find and delete the corresponding Tower Spot
			var spot_position
			for spot in get_parent().get_node("TowerSpots").get_children():
				if (spot.global_position-self.global_position).length()<1:
					spot_position = spot.global_position
					spot.queue_free()
					break
			# Place the tower in the Spot position
			var NewTower = towerScene.instance()
			NewTower.global_position = spot_position
			get_parent().get_node("YSortObjects").add_child(NewTower)
		
	elif Input.is_action_just_pressed("right_click"):
		self.queue_free()

func able_to_build(flag):
	if flag:
		$Sprite.self_modulate = MyColors.TowerGreen
		can_build = true
	else:
		$Sprite.self_modulate = MyColors.TowerRed
		can_build = false
