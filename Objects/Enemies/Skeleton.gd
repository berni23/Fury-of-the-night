extends "res://Scripts/Enemy.gd"

func _ready():

	self.add_to_group(Groups.Enemies)
	prob = randi()%11+1 
	
	

