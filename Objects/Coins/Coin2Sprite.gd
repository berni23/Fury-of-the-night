extends "res://Scripts/CoinMoving.gd"

func _ready():
	Value=1
	self.add_to_group(Groups.Money)
	VectorCoins= Vector2(pos_final.x-self.global_position.x,pos_final.y-self.global_position.y).normalized()
	Angle = VectorCoins.angle()
	