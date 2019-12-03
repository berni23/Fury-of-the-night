extends TextureProgress

var challengeFifty = false
var challengeTwoHundred = false
var challengeItems = false

var items = ["Mud","Friend","Tower1","Tower2","Tower3","Bomb","Shred"]

export (PackedScene) var filled
var message = 'hi'
func _ready():
	get_node("/root/GameMaster").connect("Dead_enemy",self,"_on_enemy_dead")
	
func _on_Chakra_value_changed(value):
	if self.value==self.max_value:
		self.add_child(filled.instance())
		
func _on_enemy_dead(num):
	if num>=50 and challengeFifty==false:
		message = '50 enemy challenge completed!'
		$Label.text = message
		$Completed.play()
		$TimerLetters.start()
		$TimerChallenge.start()
		challengeFifty = true
		self.value+=1 # afegir  una escena amb musiqueta i label dien que guanyes un chakra
		
	elif num>=200 and challengeTwoHundred==false:
		message = '200 enemy challenge completed!'
		$Label.text = message
		$Completed.play()
		$TimerLetters.start()
		$TimerChallenge.start()
		challengeTwoHundred = true
		self.value +=1

func _on_TimerChallenge_timeout():
	$Label.visible_characters=0
func _on_TimerLetters_timeout():
	$Label.visible_characters+=1
	if $Label.visible_characters==len(message):
		$TimerLetters.stop()

func item_used(item):
	if challengeItems ==false:
		items.erase(item)
		if len(items)==0:
			$Completed.play()
			message = 'Items challenge completed!'
			$Label.text = message
			$TimerChallenge.start()
			$TimerLetters.start()
			challengeItems =true
			self.value +=1
		
		else: return
			
		
    
	
	

