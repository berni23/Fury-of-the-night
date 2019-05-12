extends Area2D

var speed 
var t_life
var t_burn
var damage =1

func _ready():
	
	t_burn = OS.get_ticks_msec()
	
	var vect_speed = speed.normalized()
	
	var beta = vect_speed.angle()
	
	self.rotate(beta)

func _process(delta):
	
	
	self.translate(speed*delta)
	if OS.get_ticks_msec() -t_burn  > 1000*t_life:
		
		 self.queue_free()