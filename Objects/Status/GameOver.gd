extends Node2D


var speed = 300
var speed2 =1
var speed3 =0.1
var c=0

var move =true
var stop =false

export (PackedScene) var MenuOver

func _ready():
	
	self.get_node('Label').text = self.get_parent().Message
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
				
				var Over = MenuOver.instance()
				self.get_parent().add_child(Over)
				
				#print (speed3*delta)

	c+=speed3*delta
	self.get_node('Label').add_color_override("font_color",Color(cos(5*c),0.5,sin(5*c)))
	
	
	