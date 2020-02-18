extends Node2D


var Siren=true 
var c = 0
func _ready():
	$SoundSiren.play()
	

func _process(delta):
	
	if Siren == true:
		$Sprite.rotate(delta/2)
		c+= delta/2
		self.get_node('Sprite').set_modulate(Color(0,sin(5*c)*sin(5*c),0))

	
func _on_AnimatedSprite_animation_finished():
	
	var list1 = get_parent().get_node('Path2D').get_children()
	var list2 = get_parent().get_node('YSortTowers').get_children()
	var list3 = get_parent().get_node('YSortObjects').get_children()
	var list4 = get_parent().get_node('WarriorPath').get_children()
	
	if len(list1) !=0:
	
		for thing in list1: thing.queue_free()
	
	if len(list2) !=0:
		
		for otherThing in list2: otherThing.queue_free()
	
	if len(list3) !=0:
	
		for stuff in list3: stuff.queue_free()
		
	if len(list4)!=0:
		
		for people in list4: people.queue_free()
		
	self.queue_free()

func _on_Timer_timeout():
	
	$fiu.play()
	$Path2D/FollowNuke.show()
	$Path2D/FollowNuke.nuke = true
	$Explosion.play()
	$SoundSiren.stop()
	$Sprite.hide()
	

#