extends "res://Scripts/Enemy.gd"


func _ready():
	
	$HealthBar.max_value= get_parent().get_parent().life_skeleton
	$HealthBar.value = $HealthBar.max_value
	#$HealthBar.value = get_node("/root/SavedVars").life_skeleton
	damage = 1

