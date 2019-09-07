extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Connect to the signal of Coins changed
	get_node("/root/GameMaster").connect("Coins_changed",self,"_on_Main_Coins_changed")
	get_node("/root/GameMaster").connect("Bombs_changed",self,"_on_Main_Bombs_changed")

func _on_Main_Coins_changed(coins):
	# Update the text of the coins label only when the signal is recieved
	self.get_node("Counters/CoinsLabel").text = str(coins)
	

	

func _on_EndPath_area_entered(area):
	
	get_node("VBoxContainer/Life").value -=1
	
	if get_node("VBoxContainer/Life").value <=0:
		
			print('GAME OVER')



func _on_GameMaster_Bombs_changed(Bombs):
	self.get_node("Counters/BombsLabel").text = str(Bombs)
