extends "res://Scripts/Enemy.gd"


func _ready():
	
	$HealthBar.value = get_node("/root/SavedVars").life_skeleton
	damage = 1

