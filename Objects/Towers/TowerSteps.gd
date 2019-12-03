extends Area2D


export (PackedScene) var bala
var step1 = preload('res://Assets/Images/TowerSteps/TowerStep1.png')
var step2 = preload('res://Assets/Images/TowerSteps/TowerStep2.png')
var step3 = preload('res://Assets/Images/TowerSteps/TowerStep3.png')
var step4 = preload('res://Assets/Images/TowerSteps/TowerStep4.png')
var step5 = preload('res://Assets/Images/TowerSteps/TowerStep5.png')
var step6 = preload('res://Assets/Images/TowerSteps/TowerStep6.png')
var step7 = preload('res://Assets/Images/TowerSteps/TowerStep7.png')
var step8 = preload('res://Assets/Images/TowerSteps/TowerStep8.png')
var step9 = preload('res://Assets/Images/TowerSteps/TowerStep9.png')
var final = preload('res://Assets/Images/TowerSteps/TowerFinal.png')
var reload = true
var speed_bala = 400
var Steps = [step2,step3,step4,step5,step6,step7,step8,step9,final]
var build = false
var enemy_range = []
var s =0

func _ready():
	get_tree().get_root().get_node("GameMaster/Chakra").item_used("Tower2")
	add_to_group(Groups.Towers)
	$hammer.play()

	
func _on_Timer_timeout():
	s =s+1
	if s==8:
		$Timer.stop()
		$hammer.stop()
		build =true
	get_node('Sprite').set_texture(Steps[s])
	

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


func _on_hammer_finished():
	$hammer.play()
	
func _on_TowerSteps_area_entered(area):
		if area.get_parent().is_in_group(Groups.Enemies) and build==true:
			enemy_range.append(area.get_parent())

func _on_TowerSteps_area_exited(area):
	if area.get_parent().is_in_group(Groups.Enemies) and build ==true:
		enemy_range.erase(area.get_parent())


func _on_ReloadTimer_timeout():
		reload = true
		$ReloadTimer.stop()
	
