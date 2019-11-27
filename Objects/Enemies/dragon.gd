extends "res://Scripts/Enemy.gd"

var old_animation

func _ready():
	self.add_to_group(Groups.Fly)
	speed = 700
	damage = 5
	# Variable to detect animation change for scream
	old_animation = $AnimatedSprite.animation

func _process(delta):
	# ._process(delta) "SUPER" call NOT neede for _process or _ready
	if $AnimatedSprite.animation != old_animation:
		$Roar.play()
	old_animation = $AnimatedSprite.animation

