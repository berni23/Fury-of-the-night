extends "res://Scripts/Enemy.gd"

var old_animation

func _ready():
	self.add_to_group(Groups.Fly)
	speed = 150
	damage = 5
	
	$HealthBar.max_value= get_parent().get_parent().life_dragon
	$HealthBar.value = $HealthBar.max_value
	#$HealthBar.value = get_node("/root/SavedVars").life_dragon
	# Variable to detect animation change for scream
	old_animation = $AnimatedSprite.animation

func _process(delta):
	# ._process(delta) "SUPER" call NOT neede for _process or _ready
	if $AnimatedSprite.animation != old_animation:
		$Roar.play()
	old_animation = $AnimatedSprite.animation

