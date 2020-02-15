extends Node

export (PackedScene) var nextIcon
export (PackedScene) var skeleton
export (PackedScene) var dragon
export (PackedScene) var Warrior
export (PackedScene) var Spider

var currentRound = 0
var k = 0
var j = true
var perfect = false

var currentChapter

var Chapter1 
var Chapter2
var Chapter3

signal check_perfect

func _ready():
	
	Chapter1 = [
	[ # Round 1
	
		{"Enemy":skeleton,"N_ene":50,"t_ene":2,"N_block":2,"t_block":1,"t_delay":0},
		{"Enemy":Warrior,"N_ene":2,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
	],
	[ # Round 2
		{"Enemy":skeleton,"N_ene":3,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":10,"t_ene":2,"N_block":1,"t_block":1,"t_delay":0}
	]]

	Chapter2 = [
	[ # Round 1
		{"Enemy":skeleton,"N_ene":50,"t_ene":2,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":Warrior,"N_ene":2,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
	],
	[ # Round 2
		{"Enemy":skeleton,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0},
		{"Enemy":dragon,"N_ene":1,"t_ene":1,"N_block":1,"t_block":1,"t_delay":0}
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
	count_down_next_round(5)
	
func timeWave(wave):
	
	var temps
	temps = (wave["N_ene"]-1)*wave["t_ene"]*wave["N_block"] + (wave["N_block"]-1)*wave["t_block"]+wave["t_delay"]
	
	return temps
	
	
func timeRound(ronda):
	var temps =0
	for i in len(ronda):
		temps = max(temps,timeWave(ronda[i]))
	return temps


func count_down_next_round(waitTime):
	var visualTimer = nextIcon.instance()
	visualTimer.waitTime = waitTime
	visualTimer.connect("next_round", self, "send_next_round")
	visualTimer.set_position($VisualTimerPosition.position)
	visualTimer.set_scale(Vector2(0.4,0.4))
	add_child(visualTimer)
	
func send_next_round():
	# For now we just send all the waves in the round
	# Later we can introduce delays or similar
	for wave in currentChapter[currentRound]:
		send_wave(wave)
		
	currentRound -=- 1
	if currentRound < len(currentChapter):
		var timeRound = timeRound(currentChapter[currentRound])
		yield(get_tree().create_timer(timeRound),"timeout")
		count_down_next_round(5) # For now this is fixed, but can be changed for each round if one would introduce it as a variable in round

func send_wave(wave):
	k = len(get_parent().get_node('Path2D').get_children())
	if k==0 and j==true:
		perfect =true
		get_parent().Check_Perfect(perfect)
	"""
	Retorna  N_block conjunts de Enemy, amb N_ene unitats
	per conjunt, cada unitat separada un interval t_ene 
	i cada conjunt separat un temps t_block
	
	Argument: Un diccionari amb els seguents elements
	"""
	var Enemy = wave["Enemy"]		# escena la qual conté l'enemic 
	var N_ene = wave["N_ene"]		# nombre d'enemics que es vol per oleada
	var t_ene = wave["t_ene"]		# temps concorregut entre cada enemic (segons)
	var N_block = wave["N_block"]	# Nombre d'oleadas
	var t_block = wave["t_block"]	# temps entre oleada
	
	for i in range(0,N_block):
		for j in range(0,N_ene):
			get_node("../Path2D").add_child(Enemy.instance())
			yield(get_tree().create_timer(t_ene),"timeout")
		yield(get_tree().create_timer(t_block),"timeout")
	


