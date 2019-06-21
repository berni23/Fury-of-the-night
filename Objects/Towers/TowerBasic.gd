extends Area2D

export(PackedScene) var bala
export(PackedScene) var upgrade
var speed_bala = 1200
var reload = true
var enemy_range = []
var MenuUpgrade  = false
var Up =[true,1]

func _ready():
	add_to_group(Groups.Towers)

func _on_TowerBasic_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		enemy_range.append(area.get_parent())

func _on_TowerBasic_area_exited(area):
	if area.get_parent().is_in_group(Groups.Enemies):
		enemy_range.erase(area.get_parent())

func  _process(delta):
	# If there is an enemy and tower is reloaded shoot
	if reload and len(enemy_range) != 0:
		self.shoot(enemy_range[0])
		

func shoot(enemy):
	# Crear una nova bala i assignar-li totes les propietats
	var Nbala = bala.instance()
	var vector_bala = (enemy.global_position-self.global_position).normalized()
	Nbala.speed = vector_bala*speed_bala
	Nbala.t_life= $CollisionShape2D.shape.radius/speed_bala
	self.add_child(Nbala)	
	reload = false
	$ReloadTimer.start()

func _on_ReloadTimer_timeout():
	reload = true
	$ReloadTimer.stop()

func _on_Area2D_input_event(viewport, event, shape_idx):
	
	
	if event is InputEventMouseMotion:
	
		if Input.is_action_pressed("left_click") and MenuUpgrade==false:
		
			self.add_child(upgrade.instance())
			MenuUpgrade =true

