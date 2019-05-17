extends HBoxContainer
var build = false


#func input _event():
#
#		if event is InputEventMouseButton:
#
#				var NewTower = Sprite.new()
#				var shape = RectangleShape2D.new()
#				NewTower.set_texture(preload("res://Assets/torra.png"))
#				add_child(NewTower) 
#				NewTower.set_pos(Vector2(event.position)) 
#
#				shape.set_extents(Vector2(event.position))    
#
#				Collision = CollisionShape2D.new()
#				#attach the shape to the object
#				NewTower.set_shape(shape)
#				#add it as a child
#				add_child(Collision)

func _on_Button_pressed():
	
	print("button pressed")

	build = true
	
func _input(event):
	
	var land = true # Modificar depenent de la posició clicada

	if event is InputEventMouseButton and build ==true:
		
		var NewTower = preload("res://Scenes/TowerBasic.tscn")
		get_parent().add_child(NewTower.instance())
		
		build = false
		
		
		
