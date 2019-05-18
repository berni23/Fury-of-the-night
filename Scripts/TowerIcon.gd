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
	var target_pos = get_global_mouse_position()
	target_pos = grid.world_to_map(target_pos)
	global_position = grid.map_to_world(target_pos)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if can_build:
				var NewTower = towerScene.instance()
				NewTower.global_position = global_position
				get_parent().get_node("Towers").add_child(NewTower)
				self.queue_free()
		else:
			self.queue_free()
		
func able_to_build(flag):
	if flag:
		$Sprite.self_modulate = MyColors.TowerGreen
		can_build = true
	else:
		$Sprite.self_modulate = MyColors.TowerRed
		can_build = false
