extends Area2D

var t_life = 10
var damage = 0

# These are provided by the shooting tower on creation
var initial_pos
var initial_speed 
var initial_alpha  # vertical_angle
var initial_beta  # horizontal_angle
# These might need tuning
var g = 98
var h = 80
# These are used in the internal computations
var threeDspeed
var threeDposition
# These are used to resize the shadow
var shadow_factor
var original_shadow_scale
var shadow_on_land = 0.3

func _ready():
	# Assing itself to Bullets group
	self.add_to_group(Groups.Bullets)
	# Start the timer to self-destroy at maximum range
	$LifeTimer.wait_time = t_life
	$LifeTimer.start()
	# Set up initial 3d position and speed
	threeDposition = Vector3(initial_pos[0],initial_pos[1],h)
	threeDspeed = initial_speed*Vector3(cos(initial_alpha)*cos(initial_beta),
										cos(initial_alpha)*sin(initial_beta),
										sin(initial_alpha))
	original_shadow_scale = 0.45*$Shadow.scale

func _process(delta):
	print(threeDposition)
	print(threeDspeed)
	print(global_position)
	print("=====")
	# Compute new speed in 3d
	threeDspeed -= Vector3(0,0,g*delta)
	# Move in 3d according to speed
	threeDposition += threeDspeed*delta
	# Project movement to 2d
	self.global_position = CustomFunc.project_to_2d(threeDposition,20)
	$Shadow.global_position = Vector2(threeDposition[0],threeDposition[1])
	shadow_factor = shadow_on_land + (1-shadow_on_land)*threeDposition[2]/h 
	$Shadow.scale = shadow_factor*original_shadow_scale
