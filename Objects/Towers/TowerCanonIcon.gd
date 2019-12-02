extends "res://Scripts/MainTowerIcon.gd"


func _ready():
	add_to_group(Groups.Icons)
	able_to_build(false)
	grid = get_tree().get_root().get_node("GameMaster/Pathway")
	towerPrice = get_parent().get_node('PanelControl').PriceTowerCanon

