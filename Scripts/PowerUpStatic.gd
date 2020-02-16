extends Area2D

var CoinMoving
var coin = true
var value_type

func _ready():
	get_node("/root/GameMaster").connect("Magnet_on",self,"_on_Magnet_on")
	self.add_to_group(Groups.PowerUps)

func _on_Timer_timeout():
	 $SpriteCoin.animation ="default2"

func _on_Timer2_timeout():
	self.queue_free()

func _on_Area2D_area_entered(area):
	if coin==true:
		if area.is_in_group(Groups.Hover):
			$tirori.play()
			get_parent().get_parent().add(value_type)
			coin = false
			$SpriteCoin.hide()

func _on_Magnet_on():
	var NewCoin = CoinMoving.instance()
	NewCoin.global_position =Vector2(self.global_position.x,self.global_position.y)
	self.get_parent().get_parent().get_node("YSortObjects").add_child(NewCoin)
	self.queue_free()

func _on_tirori_finished():
	self.queue_free()