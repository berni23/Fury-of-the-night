extends PathFollow2D

export(int) var HP
export(int) var speed
var old_position = Vector2(0,0)

func _ready():
	self.add_to_group(Groups.Enemies)

func _process(delta):
	
	""" Function que mou els enemics al llarg del camí """
	
	# Move along the path
	self.offset += speed*delta
	# Detect direction to choose right animation
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
	# Change the animation if needed
	if $AnimatedSprite.animation != new_animation:
		$AnimatedSprite.animation = new_animation
	# Save current position
	old_position = self.position

# The following function should be connected 
# to area_entered signal from the Area2D child node
func _hit_by_bullet(bullet):
	if bullet.is_in_group(Groups.Bullets):
		HP = HP - bullet.damage
		if HP <=0:
			self.queue_free()
		bullet.queue_free()