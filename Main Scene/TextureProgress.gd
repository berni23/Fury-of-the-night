extends TextureProgress
export (PackedScene) var filled
export (PackedScene) var powerUp

var challengeFifty = false
var challengeTwoHundred = false
var challengeItems = false
#var i =0
var c=0
var items = ["Mud","Friend","Tower1","Tower2","Tower3","Bomb","Shred"]
var message = 'hi'

func _ready():
	get_node("/root/GameMaster").connect("Dead_enemy",self,"_on_enemy_dead")
	
func _on_Chakra_value_changed(value):
	if self.value==self.max_value:
		self.add_child(filled.instance())
		
func _on_enemy_dead(num):
	if num>=50 and challengeFifty==false:
		message = '50 enemy challenge completed!'
		completed(message)
		challengeFifty = true

	elif num>=200 and challengeTwoHundred==false:
		message = '200 enemy challenge completed!'
		completed(message)
		challengeTwoHundred = true

func item_used(item):
	if challengeItems ==false:
		items.erase(item)
		if len(items)==0:
			message = 'Items challenge completed!'
			completed(message)
			challengeItems =true
			
		else: return  
	
func check_perfect():
	var life = get_parent().get_node("Status/VBoxContainer/Life").value 
	if life >=100:
		message = 'Perfect Round Completed!'
		completed(message)
		
func completed(message):
	
			$Completed.play()
			$Label.text = message
			$TimerLetters.start()
			self.add_child(powerUp.instance())
			
		    #$Label.text[i]=' '
			#	i+=1
			#	if i==len(message):
			#		i=0
			#		$Label.visible_characters=0
			#		$TimerLetters2.stop()

func _on_TimerLetters_timeout():
	$Label.visible_characters+=1
	if $Label.visible_characters==len(message):
		$TimerLetters.stop()
		$TimerLetters2.start()
		
func _on_TimerLetters2_timeout():
	c+= 1e-2
	self.get_node('Label').add_color_override("font_color", Color(0.478,0.8235,0.929,1-c))
	self.get_node('Label').add_color_override("font_outline_modulate", Color(0.478,0.8235,0.929,1-c))
	if 1-c<0.05:	
		$TimerLetters2.stop()
		self.get_node('Label').add_color_override("font_color", Color(0.478,0.8235,0.929,1))
		self.get_node('Label').add_color_override("font_outline_modulate", Color(0.478,0.8235,0.929,1))
		$Label.visible_characters=0
		c=0
	