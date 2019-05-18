extends Area2D

var speed 
var t_life
export (int) var damage

func _ready():
	# Assing itself to Bullets group
	self.add_to_group(Groups.Bullets)
	# Start the timer to self-destroy at maximum range
	$LifeTimer.wait_time = t_life
	$LifeTimer.start()
	# Choose the orientation according to speed
	var vect_speed = speed.normalized()
	var beta = vect_speed.angle()
	self.rotate(beta)

func _process(delta):
	# Move according to speed
	self.translate(speed*delta)
