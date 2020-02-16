extends "res://Scripts/Towers.gd"

export (Image) var TowerUpUnblocked
export (Image) var TowerUpblocked

func _ready():
	get_tree().get_root().get_node("GameMaster/Chakra").item_used("Tower1")
	TreshCoin = 5
	next = 'U'
