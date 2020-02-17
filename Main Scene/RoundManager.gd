extends Node

export (PackedScene) var nextIcon
export (PackedScene) var skeleton
export (PackedScene) var dragon
export (PackedScene) var Warrior
export (PackedScene) var Ogro
export (PackedScene) var Goblin

var currentRound = 0
var currentChapter

var Chapter1 
var Chapter2
var Chapter3

signal Win
var waitTime = 5  # Time for the visual timer delay

func _ready():
	
	Chapter1 = [
	[ # Round 1
		{"Enemy":skeleton,"N_ene":5,"t_ene":2,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":Warrior,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
	],
	[ # Round 2
		{"Enemy":skeleton,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":Ogro,"N_ene":2,"t_ene":5,"N_block":1,"t_block":1,"t_delay":10},
		{"Enemy":Goblin,"N_ene":10,"t_ene":1,"N_block":2,"t_block":5,"t_delay":20}
	]]

	Chapter2 = [
	[ # Round 1
		{"Enemy":skeleton,"N_ene":50,"t_ene":2,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":Warrior,"N_ene":2,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
	],
	[ # Round 2
		{"Enemy":skeleton,"N_ene":3,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":2,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
	]]

	Chapter3 = [
	[ # Round 1
		{"Enemy":skeleton,"N_ene":50,"t_ene":2,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":Warrior,"N_ene":2,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
		
	],
	[ # Round 2
		{"Enemy":skeleton,"N_ene":30,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
	]]

	currentChapter = Chapter1
	count_down_next_round()
	
func timeWave(wave):
	return (wave["N_ene"]-1)*wave["t_ene"]*wave["N_block"] + (wave["N_block"]-1)*wave["t_block"]+wave["t_delay"]
	
func timeRound(ronda):
	var temps =0
	for wave in ronda:
		temps = max(temps,timeWave(wave))
	return temps

func count_down_next_round():
	var visualTimer = nextIcon.instance()
	visualTimer.waitTime = waitTime
	visualTimer.connect("next_round", self, "send_next_round")
	visualTimer.set_position($VisualTimerPosition.position)
	visualTimer.set_scale(Vector2(0.4,0.4))
	add_child(visualTimer)
	
func send_next_round():
	for wave in currentChapter[currentRound]:
		send_wave(wave)
		
	var timeRound = timeRound(currentChapter[currentRound])
	currentRound -=- 1
	
	yield(get_tree().create_timer(timeRound),"timeout")
	if currentRound < len(currentChapter):

		count_down_next_round() # This is the time for the next round icon

	else:
		if currentChapter == Chapter1:
			while len(get_parent().get_node("Path2D").get_children()) != 0:
				yield(get_tree().create_timer(10),"timeout")
			get_parent().get_node('Chakra').check_perfect()
			
			currentChapter = Chapter2
			currentRound = 0
			count_down_next_round()
			emit_signal("Win")
		elif currentChapter == Chapter2:
			while len(get_parent().get_node("Path2D").get_children()) != 0:
				yield(get_tree().create_timer(10),"timeout")
			get_parent().get_node('Chakra').check_perfect()
			currentChapter = Chapter3
			currentRound = 0
			count_down_next_round()
		else:
			while len(get_parent().get_node("Path2D").get_children()) != 0:
				yield(get_tree().create_timer(10),"timeout")
			
			if get_parent().get_node("Status/VBoxContainer/Life").value >0 and get_parent().Game1==true:
				emit_signal("Win")
				get_parent().Game1=false
				
			

func send_wave(wave):
	"""
	Retorna  N_block conjunts de Enemy, amb N_ene unitats
	per conjunt, cada unitat separada un interval t_ene 
	i cada conjunt separat un temps t_block
	
	Argument: Un diccionari amb els seguents elements
	"""
	var Enemy = wave["Enemy"]		# escena la qual conté l'enemic 
	var N_ene = wave["N_ene"]		# nombre d'enemics que es vol per bloc
	var t_ene = wave["t_ene"]		# temps concorregut entre cada enemic (segons)
	var N_block = wave["N_block"]	# Nombre de blocs
	var t_block = wave["t_block"]	# temps entre bloc
	var t_delay = wave["t_delay"]   # delay oleada sencera
	
	yield(get_tree().create_timer(t_delay),"timeout")
	
	for i in range(0,N_block):
		for j in range(0,N_ene):
			get_node("../Path2D").add_child(Enemy.instance())
			yield(get_tree().create_timer(t_ene),"timeout")
		yield(get_tree().create_timer(t_block),"timeout")
	
	




