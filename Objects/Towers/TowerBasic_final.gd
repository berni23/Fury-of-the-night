extends "res://Scripts/Towers.gd"


func _ready():
	
	yield(get_tree().create_timer(2),"timeout")
	reload = true