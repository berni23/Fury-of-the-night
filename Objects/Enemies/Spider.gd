extends "res://Scripts/Enemy.gd"

func _ready():
	self.add_to_group(Groups.Enemies)
	speed = 80
	
