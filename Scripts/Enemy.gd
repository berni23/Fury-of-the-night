extends PathFollow2D

export(int) var HP

export(int) var speed
var old_position = Vector2(0,0)

func _process(delta):
	# Move along the path
	self.offset += speed*delta
	# Detect direction
	var alpha = rad2deg((self.position - old_position).angle())
	var new_animation
	if alpha < -135:
		new_animation = "left"
	elif alpha < -45:
		new_animation = "top"
	elif alpha < 45:
		new_animation = "right"
	elif alpha <135:
		new_animation = "bottom"
	else:
		new_animation = "left"
	if self.get_children()[0].animation != new_animation:
		self.get_children()[0].animation = new_animation
	# Save current position
	old_position = self.position
