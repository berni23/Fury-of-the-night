extends Node2D

export (PackedScene) var FrenzyAura

var FrenziedTowers = []

func _ready():
	
	yield(get_tree().create_timer(1),"timeout")
	# First put a frenzy aura on each existing tower, while sound is playing
	# Here we also take note of which towers will be frenzied
	var aura
	for tower in get_tree().get_nodes_in_group(Groups.Towers):
		aura = FrenzyAura.instance()
		aura.add_to_group(Groups.FrenzyAura)
		tower.add_child(aura)
		FrenziedTowers.append(tower)

func _on_FrenzyBuildupTimer_timeout():
	# Make all frenzied towers shoot like crazy
	for tower in FrenziedTowers:
		if tower.has_method("crazy_shot"):
			tower.crazy_shot()
	yield(get_tree().create_timer(6),"timeout") # Wait for crazy shot to finish??
	# Finally emove all the auras
	for aura in get_tree().get_nodes_in_group(Groups.FrenzyAura):
		aura.queue_free()
	self.queue_free()
