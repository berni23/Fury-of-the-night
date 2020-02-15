extends Container

func _ready():
	# Connect to the signal of Bombs and Coins changed
	get_node("/root/GameMaster").connect("Coins_changed",self,"_on_Main_Coins_changed")


func _on_Main_Coins_changed(coins):
	# Update the text of the coins label only when the signal is recieved
	self.get_node("Counters/CoinsLabel").text = str(coins)



