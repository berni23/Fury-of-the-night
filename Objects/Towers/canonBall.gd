extends Area2D

var damage = 5
var exploded = false
# These are provided by the shooting tower on creation
var initial_pos
var initial_horizontal_speed 
var enemy_vector
# These might need tuning
var g = 98  # "Gravity"
var h = 80  # Initial "3D" height"
var c=0
# These are used in the internal computations
var threeDspeed
var threeDposition
# These are used to resize the shadow
var shadow_factor
var original_shadow_scale
var shadow_on_land = 0.3
# This takes care of which enemies will be hit
var enemy_list = []

func _ready():
	# Find variables from enemy position and parent input
	var beta = enemy_vector.angle() # horizontal_angle
	var d = enemy_vector.length()
	var vx = initial_horizontal_speed
	var vy = g/2*d/vx - h*vx/d
	# Set up initial 3d position and speed
	threeDposition = Vector3(initial_pos[0],initial_pos[1],h)
	threeDspeed = Vector3(vx*cos(beta),vx*sin(beta),vy)
	original_shadow_scale = 0.45*$Shadow.scale
	# Rotate particle emission
	$Particles2D.rotation_degrees = 90+rad2deg(beta)

	
func _process(delta):
	
	# Compute new speed in 3d
	threeDspeed -= Vector3(0,0,g*delta)
	# Move in 3d according to speed
	
	threeDposition += threeDspeed*delta
	if(threeDposition[2]<=0):
		if not exploded:
			self.explode()
			
		elif 0.3*c <250:
			
		#	$Particles2D2.amount-=1
			c+= delta  
			$Particles2D2.set_modulate(Color(0.604,0.549,0.549,1-c))
			
		return
	# Project movement to 2d
	self.global_position = CustomFunc.project_to_2d(threeDposition,20)
	$Shadow.global_position = Vector2(threeDposition[0],threeDposition[1])
	# Resize the shadow according to height
	shadow_factor = shadow_on_land + (1-shadow_on_land)*threeDposition[2]/h 
	$Shadow.scale = shadow_factor*original_shadow_scale
	
	
func _on_Node2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Enemies) or area.get_parent().is_in_group(Groups.Friends): 
		enemy_list.append(area.get_parent())

func _on_Node2D_area_exited(area):
	if area.get_parent().is_in_group(Groups.Enemies) or area.get_parent().is_in_group(Groups.Friends):
		enemy_list.erase(area.get_parent())

func explode():
	
	exploded =true
	for enemy in enemy_list:
		
		enemy.get_node('HealthBar').value -= self.damage
	$Sound2.play()
	$Sprite.hide()
	
	
	$Particles2D.emitting=false
	$Particles2D2.emitting=true

func _on_Sound2_finished():

	self.queue_free()
