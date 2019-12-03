extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var items = {"Mud": 0, "Friend":0,"Tower1":0,"Tower2":0,"Tower3":0,"Bomb":0,"Shred":0}
var list = ["Mud","Tower"]
# Called when the node enters the scene tree for the first time.
func _ready():
	
	items.erase("Mud")
	print(items)
	print(items['Tower1'])
	list.erase("Mud")
	print(list)
	list.erase("Mud")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
