extends "res://Scripts/CoinStatic.gd"


func _ready():
	
	get_node("/root/GameMaster").connect("Magnet_on",self,"_on_Magnet_on")
	CoinMoving = preload("res://Objects/Coins/heart2.tscn")
	Value = 1
	self.add_to_group(Groups.Money)


