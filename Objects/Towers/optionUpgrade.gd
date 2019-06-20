extends Node2D

export (Image) var TowerUpUnblocked
export (Image) var TowerFinUnblocked
export (Image) var TowerUpblocked
export (Image) var TowerFinblocked
export (PackedScene) var TowerUp

var treshCoins = true

func _ready():
	
	self.global_position = get_global_mouse_position()
	
	self.translate(Vector2(20,-100))

func _process(delta):
	
	# We should redo the function with "emit signal" instead of processing delta

	if self.get_parent().get_parent().get_parent().Coins >=5 and treshCoins==true:

		self.get_node("ButtonUp").set_button_icon(TowerUpUnblocked)
		treshCoins = false
		
	elif self.get_parent().get_parent().get_parent().Coins <5 and treshCoins == false:
		
		self.get_node("ButtonUp").set_button_icon(TowerUpblocked)
		treshCoins =true
	
func _input(event):
	
	if Input.is_action_pressed("right_click"):
		self.get_parent().MenuUpgrade = false
		self.queue_free()


func _on_ButtonUp_pressed():
	
	if treshCoins == false:
		
		var NewTower =TowerUp.instance()
		NewTower.global_position = self.get_parent().global_position
		
		get_parent().get_parent().add_child(NewTower)
		get_parent().get_parent().get_parent().Coins -=5
		get_parent().queue_free()
