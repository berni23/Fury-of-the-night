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
var magnet = preload("res://Objects/Coins/Magnet.tscn")
var heart1 = preload("res://Objects/Coins/heart.tscn")
var heart2 = preload("res://Objects/Coins/heart2.tscn")
var oldPosition = Vector2(0,0)
var nCoin
var prob
var reload =false
var Friend
var damage = 1 # default value for damaging. To be adjusted in each enemy ready function respectively

func _ready():
	self.add_to_group(Groups.Enemies)
	prob = randi()%100+1
	$HealthBar.tint_progress = healthy_color

func _process(delta):
	if $HealthBar.value <=0:
		if get_parent().get_parent().Magnet==false:
			
			if prob>95:		 nCoin = heart1.instance()
			elif prob>=90:	 nCoin = magnet.instance()
			elif prob>=80:	 nCoin = diamond1.instance()
			else:			 nCoin = coin1.instance() # Rest probability are coins!
			
		else:	# Quan ja hi ha magnet, no surten mes
			
			if prob>95:		 nCoin = heart2.instance()
			elif prob>=85:	 nCoin = diamond2.instance()
			else:			 nCoin = coin2.instance() # Rest probability are coins!
				
		nCoin.global_position =Vector2(self.global_position.x,self.global_position.y)
		self.get_parent().get_parent().get_node("YSortObjects").add_child(nCoin)
		self.queue_free()

	""" Function que mou els enemics al llarg del camí """
		
	if stop==false:
	# Move along the path
		self.offset += Speed*delta
	# Detect direction to choose right animation
		var alpha = rad2deg((self.position - oldPosition).angle())
		var new_animation
		if alpha < -135:	new_animation = "left"
		elif alpha < -45:	new_animation = "top"
		elif alpha < 45:	new_animation = "right"
		elif alpha <135:	new_animation = "bottom"
		else:				new_animation = "left"
		# Change the animation if needed
		if $AnimatedSprite.animation != new_animation:	$AnimatedSprite.animation = new_animation
		# Save current position
		oldPosition = self.position
		
	elif reload==true and stop==true:
		if Friend.get_node('HealthBar').value <=1:	
			stop = false	
		Friend.get_node('HealthBar').value -= damage
		reload=false
		$Timer2.start()

# The following function should be connected 
# to area_entered signal from the Area2D child node
#func _hit_by_bullet(bullet):
	
func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Friends):	
		Friend = area.get_parent()
		reload = true
	
	if area.is_in_group(Groups.Bullets):
		$HealthBar.value -=  area.damage	
		area.queue_free()

func _on_HealthBar_value_changed(value):
	$Timer.start()
	$HealthBar.show()
	
	if value < caution*$HealthBar.max_value:
		$HealthBar.tint_progress = caution_color

	elif value < danger*$HealthBar.max_value:	
		$HealthBar.tint_progress = danger_color

func _on_Timer_timeout():
	$HealthBar.hide()
	
func _on_Timer2_timeout():
	reload = true