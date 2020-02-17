extends Area2D

export (PackedScene) var bala
export (PackedScene) var Tup
export (PackedScene) var optionUpgrade

var TreshCoin 
var speed_bala = 1200
var reload
var enemy_range = []
var MenuUpgrade = false
var next = 'NO' # = U,F,NO stands for Up, Final, or No upgrade option
var firstClick = true
var life = 10

func _ready():
	get_node("Area2D").add_to_group(Groups.TargetGoblins)
	add_to_group(Groups.Towers)
	reload = false
	yield(get_tree().create_timer(2),"timeout")
	reload = true

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
	var vector_bala = (enemy.global_position-self.global_position).normalized()
	# Crear una nova bala i assignar-li totes les propietats
	self.create_bullet(vector_bala)
	reload = false
	$ReloadTimer.start()
	
func create_bullet(vector):
	var Nbala = bala.instance()
	Nbala.speed = vector*speed_bala
	Nbala.t_life = $CollisionShape2D.shape.radius/speed_bala
	self.add_child(Nbala)

func _on_ReloadTimer_timeout():
	reload = true
	$ReloadTimer.stop()
	
func crazy_shot():
	var angles = range(0,360,6)
	for angle in angles:
		yield(get_tree().create_timer(0.1),"timeout")
		self.create_bullet(Vector2(cos(deg2rad(angle)),sin(deg2rad(angle))))

func _on_Area2D_input_event(viewport, event, shape_idx):
	#Volem evitar que el menu aparegui quan creem la torra
	if firstClick:
		firstClick = false
		return
	
	if event is InputEventMouseButton and next!='NO':
		if Input.is_action_pressed("left_click") and MenuUpgrade==false:
			self.add_child(optionUpgrade.instance())
			MenuUpgrade =true

func Upgrade():
		var NewTower = Tup.instance()
		NewTower.global_position = self.global_position
		get_parent().add_child(NewTower)
		self.queue_free()

func hurt(val):
	
	self.life -=val
	if self.life <=0:
		self.queue_free()
	print('inside hurt')
	print(life)
		

func connecting(goblin):
	print('connected')
	goblin.get_node('Timer2').connect('timeout',self,'hurt',[goblin.damage])
	

