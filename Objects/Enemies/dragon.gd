extends "res://Scripts/Enemy.gd"


func _ready():
	self.add_to_group(Groups.Enemies)
	self.add_to_group(Groups.Fly)
	prob = randi()%11+1 
	Scream = $Roar
	Speed = 150
   
    