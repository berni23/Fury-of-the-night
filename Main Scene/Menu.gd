extends Node2D

export (PackedScene) var Main
var first = true

func _on_Button_pressed():
	if first ==true:
		$start.play()
		first = false

func _on_Button2_pressed():
	if first ==true:
		$exit.play()
		first = false

func _on_Button2_mouse_entered():
	$mouse2.show()
	$mouse1.hide()
	
func _on_Button_mouse_entered():
	$mouse1.show()
	$mouse2.hide()

func _on_start_finished():
	get_tree().change_scene("res://Main Scene/Main.tscn")

func _on_exit_finished():
	get_tree().quit()
