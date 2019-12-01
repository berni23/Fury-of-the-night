extends Node

var Coins = 0
var Bomb = 0
var Mud = 0
var Thunder = 0
var Shred = 0
var Magnet = false
var Game1 = true

signal Coins_changed
signal Bomb_changed
signal Magnet_on
#signal Chakra_changed

export (PackedScene) var GameOver
export (PackedScene) var Rain
export (PackedScene) var BackToFuture


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

func _ready():
	#self.get_node('PanelControl/Projectiles/Bomb').set_modulate(Color( 1, 0.5, 0.31, 1 ))
	#self.add_child(Rain.instance())
	#get_node('Creep').play()
	self.add_Coins(3000)
	self.add_Bomb(5)
	

#func _on_Creep_finished():
	
	
func Magnet_on():
	self.Magnet = true
	emit_signal("Magnet_on")
	$MagnetDuration.start()
	
func add(value_type):
	match value_type[1]:
		"coins":	self.add_Coins(value_type[0])
		"life":		self.add_Life(value_type[0])
		"chakra":	self.add_Chakra(value_type[0])
		_:			print("ERROR: Unexpected value type!")

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

func add_Chakra(val):
	get_node("Chakra").value+=val
	#emit_signal("Bomb_changed",self.Bomb)
		
		
func add_Coins(val):
	# Aquesta funció canvia el valor de les monedes i emet un senyal
	# D'aquesta manera, cada cop que els diners canviin, els botons
	# icones i altres poden reaccionar de forma corresponent.
	# A partir d'ara, qualsevol canvi en les monedes s'ha de fer 
	# a traves d'aquesta funció i mai canviar Main.Coins manualment.
	self.Coins += val
	emit_signal("Coins_changed",self.Coins)
	
func add_Life(val):
	get_node("Status/VBoxContainer/Life").valsue += val
	if get_node("Status/VBoxContainer/Life").value <=0 and Game1==true:
		self.add_child(GameOver.instance())
		Game1=false
		#print('GAME OVER')
		
func _on_MagnetDuration_timeout():
	self.Magnet=false
	
#func _input(event):
#   if event is InputEventMouseButton:
#       print(event.position)

func _on_TimerFuture_timeout(): # If pos.offset smaller than treshold (just change the required velocities)
	for node in get_node('Path2D').get_children():
		if node.is_in_group(Groups.Fly):
			node.speed = 150
		elif node.is_in_group(Groups.Enemies):
			node.speed = 100
		yield(get_tree().create_timer(0.5),"timeout")
