extends Node
var Coins = 0
var Bombs = 0
var Mud = 0
var Thunders = 0
export (PackedScene) var skeleton
export (PackedScene) var dragon
export (PackedScene) var Warrior
export (PackedScene) var Spider


signal Coins_changed
signal Bombs_changed

""" Recordatori de les collision layers
Enemics Layer2 Mask1
Torres Mask2
Bales Layer1

IconaTorres Layer3
RajolaTorres Mask3
"""

func _rafaga(Enemy,N_ene,t_ene,N_ole,t_ole):
	"""
	Retorna  N_ole conjunts de Enemy, amb N_ene unitats
	per conjunt, cada unitat separada un interval t_ene 
	i cada conjunt separat un temps t_ole
	
	Arguments
	
	Enemy: escena la qual conté l'enemic 
	N_ene: nombre d'enemics que es vol per oleada
	t_ene: temps concorregut entre cada enemic ( segons)
	N_ole: Nombre d'oleadas
	t_ole: temps entre oleada
	"""
	for i in range(0,N_ole):
		for j in range(0,N_ene):
			$Path2D.add_child(Enemy.instance())
			yield(get_tree().create_timer(t_ene),"timeout")
		yield(get_tree().create_timer(t_ole),"timeout")

func _ready():
	
	get_node('Creep').play()
	self.add_Coins(100)
	self.add_Bombs(5)
		
	_rafaga(Warrior,2,1,1,1)
func _on_Creep_finished():
	
	_rafaga(skeleton,1,1,1,1)
	_rafaga(dragon,1,1,1,1)
#	_rafaga(Warrior,1,1,1,1)
	_rafaga(skeleton,1,1,1,1)
	_rafaga(skeleton,1,1,1,1)
	_rafaga(skeleton,40,0.9,2,0.1)
	
	
	
	

	
func add_Mud(val):

	self.Mud += val


func add_Coins(val):
	# Aquesta funció canvia el valor de les monedes i emet un senyal
	# D'aquesta manera, cada cop que els diners canviin, els botons
	# icones i altres poden reaccionar de forma corresponent.
	# A partir d'ara, qualsevol canvi en les monedes s'ha de fer 
	# a traves d'aquesta funció i mai canviar Main.Coins manualment.
	self.Coins += val
	emit_signal("Coins_changed",self.Coins)
	
func add_Bombs(val):

	self.Bombs += val
	emit_signal("Bombs_changed",self.Bombs)


func add_Thunders(val):
	
	self.Thunders += val
	emit_signal("Thunders_changed",self.Thunders)


