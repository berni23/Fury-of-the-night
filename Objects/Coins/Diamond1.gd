extends "res://Scripts/CoinStatic.gd"

func _ready():
	
	CoinMoving = preload("res://Objects/Coins/Diamond2.tscn")
	get_node("/root/GameMaster").connect("Magnet_on",self,"_on_Magnet_on")
	Value = 5
	self.add_to_group(Groups.Money)
	

	