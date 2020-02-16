extends Node2D

export (PackedScene) var FrenzyAura

var FrenziedTowers = []

func _ready():
	# First put a frenzy aura on each existing tower, while sound is playing
	# Here we also take note of which towers will be frenzied
	var aura
	for object in get_parent().get_node("TowerSpots"):
		if object.is_in_group(Groups.Towers):
			aura = FrenzyAura.instance()
			aura.add_to_group(Groups.FrenzyAura)
			object.add_child(aura)
			FrenziedTowers.append(object)

func _on_FrenzyBuildupTimer_timeout():
	# Make all frenzied towers shoot like crazy
	for tower in FrenziedTowers:
		tower.crazy_shot()
	# Finally emove all the auras
	for aura in get_tree().get_nodes_in_group(Groups.FrenzyAura):
		aura.queue_free()
	self.queue_free()
