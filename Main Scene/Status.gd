extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	
	self.get_node("Counters/CoinsLabel").text = str(self.get_parent().Coins) + ' COINS'
	

func _on_EndPath_area_entered(area):
	
	get_node("VBoxContainer/Life").value -=1
	
	if get_node("VBoxContainer/Life").value <=0:
		
			print('GAME OVER')

