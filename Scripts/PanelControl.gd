extends HBoxContainer


#var Children
#var Incompatible = {}
#

export (PackedScene) var towerIcon
var getCoins = preload("res://Scenes/getCoins.tscn")
var BombIcon = preload("res://Scenes/BombIcon.tscn")
var MudIcon = preload("res://Scenes/MudIcon.tscn")
# Quan tinguem molts buttons, el millor serà fer un diccionari de els noms i true, fals,
# que només deixi un element ser true . ( sempre que sen apreti un, els altres eliminin la 'icona'
#func _ready():
	
#	Children = self.get_children()
#	for i in Children:
#
#		Incompatible[Children] = false


func _on_CreateTower_pressed():
	
	# Delete existing Icons and create a new TowerIcon
	get_tree().call_group(Groups.Icons,"queue_free")
	get_parent().add_child(towerIcon.instance())
	

func _on_HoverCoins_pressed():
	
		get_tree().call_group(Groups.Icons,"queue_free")
		self.get_parent().add_child(getCoins.instance())
	
func _on_Bomb_pressed():
	
	get_tree().call_group(Groups.Icons,"queue_free")
	self.get_parent().add_child(BombIcon.instance())
	

	


func _on_Mud_pressed():
	get_tree().call_group(Groups.Icons,"queue_free")
	self.get_parent().add_child(MudIcon.instance())
	pass # replace with function body
