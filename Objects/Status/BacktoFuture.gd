extends Node2D

var c =0
var color = false

func _ready():
	$timeTravel.play()

func _process(delta):
	if color == true:
		$Sprite.modulate = Color(1-c,1-c,1-c,1)
		c+= 0.3*delta

func _on_Timer_timeout():
	var list = get_parent().get_node('Path2D').get_children()
	if len(list)>0:
		for node in list:
				if node.is_in_group(Groups.Enemies):
						node.offset = 0
						node.speed = 0
						
	self.queue_free()
	get_parent().get_node('TimerFuture').start()
	
func _on_Timer2_timeout():
		color = true
		$timeTravel.stop()
		$backToFuture.play()
		$Timer.start()

	
	
