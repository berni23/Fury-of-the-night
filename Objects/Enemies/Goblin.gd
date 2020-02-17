extends PathFollow2D

var speed = 100
var caution_color = Color.yellow
var danger_color = Color.red
var caution = 0.5
var danger = 0.2
var oldPosition = Vector2(0,0)
var damage = 2
var towerList =[]
var first = true
var newTower

func _ready():
	self.add_to_group(Groups.Enemies)
	self.add_to_group(Groups.Goblins)

func _process(delta):
	""" Function que mou els enemics al llarg del camí """
	if len(towerList)==0:
		self.offset += speed*delta
		var alpha = rad2deg((self.position - oldPosition).angle())
		var new_animation
		if alpha < -135:
			new_animation = "left"
			$Towerhit.global_rotation_degrees= 0
		elif alpha < -45:
			new_animation = "top"
			$Towerhit.global_rotation_degrees= 90
		elif alpha < 45:
			new_animation = "right"
			$Towerhit.global_rotation_degrees= 0
		elif alpha <135:
			new_animation = "bottom"
			$Towerhit.global_rotation_degrees= 90
		else:
			new_animation = "left"
			$Towerhit.global_rotation_degrees= 0
		
		if $AnimatedSprite.animation != new_animation:	
			$AnimatedSprite.animation = new_animation
		oldPosition = self.position
		
func _on_Towerhit_area_entered(area):
	if area.is_in_group(Groups.TargetGoblins):
		towerList.append(area.get_parent())
		if first ==true:
			first = false
			newTower = area.get_parent()
			newTower.connecting(self)
			
			if $AnimatedSprite.animation =="left" or $AnimatedSprite.animation =="right":
				if newTower.global_position.y > self.global_position.y:
					$AnimatedSprite.animation = "attackbottom"
					
				elif  newTower.global_position.y < self.global_position.y:
						$AnimatedSprite.animation = "attacktop"
						
			elif $AnimatedSprite.animation =="top" or $AnimatedSprite.animation =="bottom":
					if newTower.global_position.x > self.global_position.x:
						$AnimatedSprite.animation = "attackright"
	
					elif  newTower.global_position.x < self.global_position.x:
							$AnimatedSprite.animation = "attackleft"
				
	if area.is_in_group(Groups.Bullets):
		$HealthBar.value -=  area.damage	
		area.queue_free()

func _on_Towerhit_area_exited(area):
	if area.is_in_group(Groups.TargetGoblins):
		towerList.erase(area.get_parent())
		if len(towerList)==0:	self.first=true

func _on_HealthBar_value_changed(value):
	$Timer.start()
	$HealthBar.show()
	if value < caution*$HealthBar.max_value:
		$HealthBar.tint_progress = caution_color
	elif value < danger*$HealthBar.max_value:	
		$HealthBar.tint_progress = danger_color
	
	if $HealthBar.value <=0:
		self.get_parent().get_parent().enemies_dead(1)
		self.queue_free()
	
func _on_Timer_timeout():
	$HealthBar.hide()


