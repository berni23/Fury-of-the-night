extends Area2D

export (PackedScene) var bala

var TreshCoin 
var speed_bala = 100
var reload = true
var enemy_range = []
var next = 'NO'

func _ready():
	var chakra = get_tree().get_root().get_node("GameMaster/Chakra")
	if chakra:
		chakra.item_used("Tower3")
	add_to_group(Groups.Towers)

func _on_TowerCanon_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		enemy_range.append(area.get_parent())

func _on_TowerCanon_area_exited(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		enemy_range.erase(area.get_parent())

func  _process(delta):
	if reload and len(enemy_range) != 0:
		self.shoot(enemy_range[0])
		
func shoot(enemy):
	var Nbala = bala.instance()
	Nbala.initial_pos = self.global_position
	var enemy_vector = enemy.global_position-self.global_position
	# These part might need to be modified for better visuals
	Nbala.initial_speed = 200
	Nbala.initial_alpha = deg2rad(60)
	Nbala.initial_beta = enemy_vector.angle()
	self.add_child(Nbala)
	reload = false
	$ReloadTimer.start()

func _on_ReloadTimer_timeout():
	reload = true
	$ReloadTimer.stop()
