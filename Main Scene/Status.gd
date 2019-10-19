extends Container


func _ready():
	# Connect to the signal of Coins changed
	get_node("/root/GameMaster").connect("Coins_changed",self,"_on_Main_Coins_changed")
	get_node("/root/GameMaster").connect("Bomb_changed",self,"_on_Main_Bomb_changed")

func _on_Main_Coins_changed(coins):
	# Update the text of the coins label only when the signal is recieved
	self.get_node("Counters/CoinsLabel").text = str(coins)

func _on_EndPath_area_entered(area):
	
	if area.get_parent().is_in_group(Groups.Enemies):
	
		get_node("VBoxContainer/Life").value -=1
		
		if get_node("VBoxContainer/Life").value <=0:
			
				print('GAME OVER')

func _on_Main_Bomb_changed(Bomb):
	self.get_node("Counters/BombsLabel").text = str(Bomb)
