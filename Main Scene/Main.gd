extends Node
var Coins = 0
var Bomb = 0
var Mud = 0
var Thunder = 0
var Shred= 0
var Magnet = false
export (PackedScene) var skeleton
export (PackedScene) var dragon
export (PackedScene) var Warrior
export (PackedScene) var Spider

signal Coins_changed
signal Bomb_changed
signal Magnet_on

""" Recordatori de les collision layers
Enemics Layer2 Mask1
Torres Mask2
Bales Layer1

IconaTorres Layer3
RajolaTorres Mask3
"""

"""

tirar bombes -> b
col.locar fang -> m
tirar llamp ->t

"""

func _rafaga(Enemy,N_ene,t_ene,N_wave,t_wave):
	"""
	Retorna  N_wave conjunts de Enemy, amb N_ene unitats
	per conjunt, cada unitat separada un interval t_ene 
	i cada conjunt separat un temps t_wave
	
	Arguments
	
	Enemy: escena la qual conté l'enemic 
	N_ene: nombre d'enemics que es vol per oleada
	t_ene: temps concorregut entre cada enemic (segons)
	N_ole: Nombre d'oleadas
	t_ole: temps entre oleada
	"""
	for i in range(0,N_wave):
		for j in range(0,N_ene):
			$Path2D.add_child(Enemy.instance())
			yield(get_tree().create_timer(t_ene),"timeout")
		yield(get_tree().create_timer(t_wave),"timeout")

func _ready():
	
	get_node('Creep').play()
	self.add_Coins(100)
	self.add_Bomb(5)
		
	_rafaga(Warrior,2,1,1,1)
	
	#self.connect("Magnet_on",self,"_on_Main_Magnet_on")
	

func Magnet_on():
	
	self.Magnet = true
	emit_signal("Magnet_on")
	$MagnetDuration.start()
	
func _on_Creep_finished():
	
	_rafaga(skeleton,1,1,1,1)
	_rafaga(dragon,1,1,1,1)
#	_rafaga(Warrior,1,1,1,1)
	_rafaga(skeleton,1,1,1,1)
	_rafaga(skeleton,1,1,1,1)
	_rafaga(skeleton,40,0.9,2,0.1)

func add_Thunder(val):	
#With this function we modify the available amounts of traps and projectiles
	self.Thunder+=val
	
func add_Mud(val):
	self.Mud+=val
func add_Shred(val):
	
	self.Shred+=val
	
func add_Bomb(val):

	self.Bomb+=val
	emit_signal("Bomb_changed",self.Bomb)
		
func add_Coins(val):
	# Aquesta funció canvia el valor de les monedes i emet un senyal
	# D'aquesta manera, cada cop que els diners canviin, els botons
	# icones i altres poden reaccionar de forma corresponent.
	# A partir d'ara, qualsevol canvi en les monedes s'ha de fer 
	# a traves d'aquesta funció i mai canviar Main.Coins manualment.
	self.Coins += val
	emit_signal("Coins_changed",self.Coins)


func _on_MagnetDuration_timeout():
	self.Magnet=false
