extends Node2D

export (PackedScene) var Main

#func _ready():
	
#	var a = get_viewport().size
	#print(a)
	#$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.grab_focus()

#func _physics_process(delta):
#	if $MarginContainer/VBoxContainer/VBoxContainer2/Button.is_hovered()==true:
#		$MarginContainer/VBoxContainer/VBoxContainer2/Button.grab_focus()
#	if $MarginContainer/VBoxContainer/VBoxContainer2/Button2.is_hovered()==true:
#		$MarginContainer/VBoxContainer/VBoxContainer2/Button2.grab_focus()
#


func _on_Button_pressed():	
	$start.play()	
	
func _on_Button2_pressed():	
	$exit.play()
	
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
