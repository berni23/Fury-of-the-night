extends HBoxContainer

export (PackedScene) var towerIcon
export (PackedScene) var getCoins 
export (PackedScene) var BombIcon
export (PackedScene) var MudIcon

func delete_existing_icons():
	get_tree().call_group(Groups.Icons,"queue_free")

func _on_CreateTower_pressed():
	delete_existing_icons()
	get_parent().add_child(towerIcon.instance())

func _on_HoverCoins_pressed():
	delete_existing_icons()
	self.get_parent().add_child(getCoins.instance())

func _on_Bomb_pressed():
	delete_existing_icons()
	self.get_parent().add_child(BombIcon.instance())

func _on_Mud_pressed():
	delete_existing_icons()
	self.get_parent().add_child(MudIcon.instance())
