extends Node2D

var c =0
var color = false

func _ready():
	$timeTravel.play()

func _process(delta):
	if color == true:
		$Sprite.modulate = Color(1-c,1-c,1-c,1)
		c+= 0.3*delta
		
func _on_timeTravel_finished():
		color = true
		$backToFuture.play()
		$Timer.start()

#func _on_backToFuture_finished():
#		var list = get_parent().get_node('Path2D').get_children()
#		for node in list:
#			if node.is_in_group(Groups.Enemies):
#					node.offset = 0
#					node.speed = 0
#					self.queue_free()

func _on_Timer_timeout():
	
	var list = get_parent().get_node('Path2D').get_children()
	for node in list:
			if node.is_in_group(Groups.Enemies):
					node.offset = 0
					node.speed = 0
					self.queue_free()
	get_parent().get_node('TimerFuture').start()
	
