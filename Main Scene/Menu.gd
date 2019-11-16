extends Node2D

export (PackedScene) var Main

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.grab_focus()

func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.is_hovered()==true:
		$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer2/TextureButton2.is_hovered()==true:
		$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton2.grab_focus()
	
func _on_TextureButton_pressed():
	
	get_tree().change_scene("res://Main Scene/Main.tscn")

func _on_TextureButton2_pressed():
	get_tree().quit()