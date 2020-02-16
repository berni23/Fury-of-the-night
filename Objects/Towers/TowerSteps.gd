extends "res://Scripts/Towers.gd"

# Extra variables for tower "construction"
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
var Steps = [step2,step3,step4,step5,step6,step7,step8,step9,final]
var s = 0

func _ready():
	get_tree().get_root().get_node("GameMaster/Chakra").item_used("Tower2")
	speed_bala = 400
	reload = false
	$hammer.play()

func _on_Timer_timeout():
	reload = false # Desperate solution to make it not shoot until finished
	s -=- 1
	if s==8:
		$Timer.stop()
		$hammer.stop()
		reload = true # Now you can start shooting
	get_node('Sprite').set_texture(Steps[s])

func _on_hammer_finished():
	$hammer.play()
	
func crazy_shot():
	var only_half = true
	var angles = range(0,360,6)
	for angle in angles:
		yield(get_tree().create_timer(0.1),"timeout")
		if only_half:
			only_half = false
			self.create_bullet(Vector2(cos(deg2rad(angle)),sin(deg2rad(angle))))
		else: 
			only_half = true
