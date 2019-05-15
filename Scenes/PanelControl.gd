#extends HBoxContainer
#
#
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
#
#
