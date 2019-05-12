extends Node

var enemy = preload("res://Scenes/Skeleton.tscn")

func _ready():
	$Path2D.add_child(enemy.instance())
	yield(get_tree().create_timer(5),"timeout")
	$Path2D.add_child(enemy.instance())
