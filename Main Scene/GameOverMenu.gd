extends Node2D


func _ready():
	print('GameOver Menu activated')
	self.global_position =Vector2(400,460)

func _on_Button1_pressed():
	get_tree().change_scene("res://Main Scene/Menu.tscn")

func _on_Button2_pressed():
	get_tree().quit()