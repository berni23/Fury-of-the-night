extends "res://Scripts/PowerUpStatic.gd"

func _ready():
	value_type = [1,"chakra"]
	#value_type = [5,"coins"]
	CoinMoving = preload("res://Objects/Coins/Diamond2.tscn")