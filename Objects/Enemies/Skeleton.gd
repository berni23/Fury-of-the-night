extends "res://Scripts/Enemy.gd"


#onready var health_bar = $HealthBar

func _ready():

	self.add_to_group(Groups.Enemies)
	prob = randi()%10+1

