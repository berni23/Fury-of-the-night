extends Node2D

var move =true
var speed = 300
var speed2 =1
var speed3 =0.1
var stop =false
var c =0

func _ready():
	self.position.x=1000
	
func _process(delta):
	if stop==false:
		if move==true: 
			self.position.x -=speed*delta
			if self.position.x <1:
				move=false
		elif move==false:
			self.scale.y+= speed2*delta
			#print(scale.y)
			self.position.y-= speed*delta	
			if self.scale.y>= 5.75:
				stop=true
				#print (speed3*delta)
															
	c+=speed3*delta
	self.get_node('Label').add_color_override("font_color",Color(cos(5*c),0.5,sin(5*c)))
	