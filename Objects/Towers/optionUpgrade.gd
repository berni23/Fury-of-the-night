extends Node2D

export (Image) var TowerUpUnblocked
export (Image) var TowerFinUnblocked
export (Image) var TowerUpblocked
export (Image) var TowerFinblocked
export (PackedScene) var TowerUp
export (PackedScene) var TowerFin


# Make tower black: gimp-> colorize  Hue : 295 / Saturation : 1 / Brightness : -55
	

var treshCoins1 =[true,5]
var treshCoins2 = [true,7]
var NewTower 

func _ready():
	
	self.global_position = get_global_mouse_position()
	
	self.translate(Vector2(50,-100))

func _process(delta):
	
	# We should redo the function with "emit signal" instead of processing delta
	if self.get_parent().Up[1]==1:
	
		if self.get_parent().get_parent().get_parent().Coins >=treshCoins1[1] and treshCoins1[0]==true:
	
			self.get_node("ButtonUp").set_button_icon(TowerUpUnblocked)
			treshCoins1[0] = false
		
		elif self.get_parent().get_parent().get_parent().Coins <treshCoins1[1] and treshCoins1[0] == false:
		
			self.get_node("ButtonUp").set_button_icon(TowerUpblocked)
			treshCoins1[0] =true
		
	elif self.get_parent().Up[1]==2:

		if self.get_parent().get_parent().get_parent().Coins >=treshCoins2[1] and treshCoins2[0] == true:

			self.get_node("ButtonFinal").set_button_icon(TowerFinUnblocked)
			treshCoins2[0] =true

		elif self.get_parent().get_parent().get_parent().Coins <treshCoins2[1] and treshCoins2[0] == false:

			self.get_node("ButtonFinal").set_button_icon(TowerFinblocked)
			treshCoins2[0] =true

func _input(event):
	
	if Input.is_action_pressed("right_click"):
		self.get_parent().MenuUpgrade = false
		self.queue_free()


func _on_ButtonUp_pressed():
	
	if treshCoins1[0] == false and get_parent().Up[0] ==true and get_parent().Up[1]==1 :
			
			
			NewTower =TowerUp.instance()
			NewTower.global_position = self.get_parent().global_position
			get_parent().get_parent().get_parent().Coins -=treshCoins1[1]
			get_parent().get_parent().add_child(NewTower)
			get_parent().queue_free()


func _on_ButtonFinal_pressed():
	
	
		if treshCoins2[0] == false and get_parent().Up[0] ==true and get_parent().Up[1]==2 :
			
			
			NewTower = TowerFin.instance()	
			NewTower.global_position = self.get_parent().global_position
			get_parent().get_parent().get_parent().Coins -=treshCoins2[1]
			get_parent().get_parent().add_child(NewTower)
			get_parent().queue_free()
	