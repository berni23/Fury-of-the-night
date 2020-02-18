extends "res://Scripts/Towers.gd"

export (Image) var TowerUpUnblocked
export (Image) var TowerUpblocked

func _ready():

	TreshCoin = 5
	next='F'
	yield(get_tree().create_timer(2),"timeout")
	reload = true
