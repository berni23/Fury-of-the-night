extends Node2D
#export (PackedScene) var TowerUp
#export (PackedScene) var TowerFin
# Make tower black: 
# gimp-> colorize  Hue : 295 / Saturation : 1 / Brightness : -55

var NewTower 

func _ready():
	
	self.global_position = get_global_mouse_position()
	self.translate(Vector2(50,-100))
	
	# Connect to changes in money, which will update the colors of the menu
	get_node("/root/GameMaster").connect("Coins_changed",self,"_on_Main_Coins_changed")
	# Call it once, to get the initial colors
	self._on_Main_Coins_changed(get_node("/root/GameMaster").Coins)

func _on_Main_Coins_changed(coins):

		if coins >= get_parent().TreshCoin:
			
			self.get_node("ButtonUp").set_button_icon(get_parent().TowerUpUnblocked)
		else:
			self.get_node("ButtonUp").set_button_icon(get_parent().TowerUpblocked)
		
func _input(event):
	
	if Input.is_action_pressed("right_click"):
		self.get_parent().MenuUpgrade = false
		self.queue_free()

func _on_ButtonUp_pressed():
	
	if get_node("/root/GameMaster").Coins >= get_parent().TreshCoin and get_parent().next!='NO':
		
		get_node("/root/GameMaster").add_Coins(-get_parent().TreshCoin)
		get_parent().Upgrade()

