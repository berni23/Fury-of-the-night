extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	self.add_to_group(Groups.Money)

func _on_Timer_timeout():
	 $SpriteCoin.animation ="default2"

func _on_Timer2_timeout():
	self.queue_free()
