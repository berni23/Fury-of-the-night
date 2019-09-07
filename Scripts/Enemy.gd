
extends PathFollow2D

export(int) var HP = 10
export(int) var Speed = 100
var coin1 = preload("res://Objects/Coins/Coin1.tscn")
var Old_position = Vector2(0,0)
var Scream =null

 
func sound(scream):
	
	if scream == null:
		
		return 
		
	else : 
	
		scream.play()

func _process(delta):

	if HP <=0:
			var nCoin = coin1.instance()
			nCoin.global_position =Vector2(self.global_position.x,self.global_position.y)
			self.get_parent().get_parent().get_node("YSortObjects").add_child(nCoin)

			self.queue_free()
	""" Function que mou els enemics al llarg del camí """

	# Move along the path
	self.offset += Speed*delta
	# Detect direction to choose right animation
	var alpha = rad2deg((self.position - Old_position).angle())
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
		
		sound(Scream)

		$AnimatedSprite.animation = new_animation

	# Save current position
	Old_position = self.position

# The following function should be connected 
# to area_entered signal from the Area2D child node
func _hit_by_bullet(bullet):
	if bullet.is_in_group(Groups.Bullets):
		HP = HP - bullet.damage
		bullet.queue_free()


