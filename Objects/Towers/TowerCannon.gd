extends Area2D

export (PackedScene) var bala

var TreshCoin 
var speed_bala = 100
var reload = true
var enemy_range = []

func _ready():
	add_to_group(Groups.Towers)

func _on_TowerCannon_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		enemy_range.append(area.get_parent())

func _on_TowerCannon_area_exited(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		enemy_range.erase(area.get_parent())

func  _process(delta):
	if reload and len(enemy_range) != 0:
		self.shoot(enemy_range[0])
		
func shoot(enemy):
	var Nbala = bala.instance()
#	bala.p_0 = self.global_position
#	bala.p_f = enemy.global_position
#	bala.speed = self.speed_bala
	self.add_child(Nbala)	
	reload = false
	$ReloadTimer.start()

func _on_ReloadTimer_timeout():
	reload = true
	$ReloadTimer.stop()

