extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var NumCoins = 0

func _process(delta):
	
	self.get_node('CoinsLabel').text = str(NumCoins)+ ' COINS'
# class member variables go here, for example:
# var a = 2
# var b = "textvar"






