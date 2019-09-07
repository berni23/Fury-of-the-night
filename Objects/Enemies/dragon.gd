extends "res://Scripts/Enemy.gd"


func _ready():
	self.add_to_group(Groups.Enemies)
	self.add_to_group(Groups.Fly)
	Scream = $Roar
	Speed = 150
	
	
