
extends PathFollow2D


var stop = false
export(int) var Speed = 100

#HP features

var healthy_color = Color.green
var caution_color = Color.yellow
var danger_color = Color.red
var caution = 0.5
var danger = 0.2


var coin1 = preload("res://Objects/Coins/Coin1.tscn")
var coin2 = preload("res://Objects/Coins/Coin2.tscn")
var diamond1 = preload("res://Objects/Coins/Diamond1.tscn")
var diamond2 = preload("res://Objects/Coins/Diamond2.tscn")
var Magnet = preload("res://Objects/Coins/Magnet.tscn")
var Old_position = Vector2(0,0)
var Scream =null
var nCoin
var prob

	
func sound(scream):
	
	if scream == null:
		return 
	else : 
		scream.play()

func _process(delta):

	if $HealthBar.value <=0:
		
		if get_parent().get_parent().Magnet==false:
			
			if prob>=4: nCoin = coin1.instance()
		
			elif prob >=2: nCoin = diamond1.instance()
				
			else : nCoin = Magnet.instance() #prob ==1

		else:
	
			if prob>=3: nCoin = coin2.instance()
			
			else: nCoin = diamond2.instance()
				
		nCoin.global_position =Vector2(self.global_position.x,self.global_position.y)
		self.get_parent().get_parent().get_node("YSortObjects").add_child(nCoin)
		self.queue_free()

	""" Function que mou els enemics al llarg del camí """
	
	if stop==false:
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
		$HealthBar.value -=  bullet.damage
		
		bullet.queue_free()
		
func _on_HealthBar_value_changed(value):
	
	$Timer.start()
	
	$HealthBar.show()
	
	if value < caution*$HealthBar.max_value:
		
		$HealthBar.tint_progress = caution_color
	
	elif value < danger*$HealthBar.max_value:
		
		$HealthBar.tint_progress = danger_color

func _on_Timer_timeout():
	
	$HealthBar.hide()
	

