extends Node2D


func _ready():
	self.global_position = Vector2(500,64)

func _on_Timer_timeout():
	$Particles2D.emitting = true
	$Applause.play()
	
