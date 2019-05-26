extends HBoxContainer


export (PackedScene) var towerIcon

func _on_CreateTower_pressed():
	# Delete existing Icons and create a new TowerIcon
	get_tree().call_group(Groups.Icons,"queue_free")
	get_parent().add_child(towerIcon.instance())

func _on_HoverCoins_pressed():
	
		var getCoins = preload("res://Scenes/getCoins.tscn")
		self.get_parent().add_child(getCoins.instance())
		
		
	

