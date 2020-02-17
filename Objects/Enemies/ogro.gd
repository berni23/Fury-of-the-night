extends "res://Scripts/Enemy.gd"


func _ready():
	self.add_to_group(Groups.Ogro)
	damage = 20
	speed = 65
	

