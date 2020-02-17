extends PathFollow2D

var speed = 100
var enemy_list=[]

#var healthy_color = Color.green
var caution_color = Color.yellow
var danger_color = Color.red
var caution = 0.5
var danger = 0.2
var damage = 1
var first = true
var newEnemy

func _ready():
	get_tree().get_root().get_node("GameMaster/Chakra").item_used("Friend")
	self.add_to_group(Groups.Friends)	
	
func _process(delta):
	if len(enemy_list)==0:
		self.offset+=speed*delta
	
func _on_Area2D_area_entered(area):
	if area.get_parent().is_in_group(Groups.Goblins):
			return
	if area.get_parent().is_in_group(Groups.Enemies): 

		if len(enemy_list)==0:
			$AnimatedSprite.animation = "Attack"
			#$Timer2.start()
		if area.get_parent().first==true:
					newEnemy=area.get_parent()
					self.connecting(newEnemy)
					area.get_parent().first=false
		enemy_list.append(area.get_parent())

func _on_Area2D_area_exited(area):
	if area.get_parent().is_in_group(Groups.Goblins):
		return
	if area.get_parent().is_in_group(Groups.Enemies):
		if area.get_parent()==enemy_list[0]:
			if len(enemy_list)>1:	
				newEnemy = enemy_list[1]
				newEnemy.connecting(self)
						
		enemy_list.erase(area.get_parent())
	
	if len(enemy_list)==0:
		$AnimatedSprite.animation = "Walk"
		self.first = true
		#$Timer2.stop()

func _on_HealthBar_value_changed(value):
	$Timer.start()
	$HealthBar.show()
	if value < caution*$HealthBar.max_value:
		$HealthBar.tint_progress = caution_color
	
	elif value < danger*$HealthBar.max_value:
		$HealthBar.tint_progress = danger_color
	
	if $HealthBar.value <=0:
		self.queue_free()
	
func _on_Timer_timeout():
	$HealthBar.hide()

func connecting(val):
	val.get_node('Timer2').connect('timeout',self,'hurt',[val.damage])
	
func hurt(val):
	get_node('HealthBar').value -=val
		