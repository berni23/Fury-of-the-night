extends AnimatedSprite

export (PackedScene) var getCoins 
#var pos_final=get_parent().get_parent().get_node(
#var pos_final= get_node("/root/GameMaster/Status/").get_position()
var pos_final= Vector2(1000,0) # Momentani. Hauria de ser la posició de  Status/Counters/CoinsLabel
var new_pos
var Angle=0.5
var VectorCoins
var move=true
var speed2d= 200
var Value=1

func _ready():
	self.animation="default"
	self.add_to_group(Groups.Money)
	VectorCoins= Vector2(pos_final.x-self.global_position.x,pos_final.y-self.global_position.y).normalized()
	Angle = VectorCoins.angle()


func _process(delta):
	
	if move==true:
		self.global_position.x+= speed2d*delta*cos(Angle)
		self.global_position.y+=speed2d*delta*sin(Angle)
	
		new_pos = self.get_global_position()
		
		if new_pos.x>pos_final.x:
	#
				get_parent().get_parent().add_Coins(Value)
				$tirori.play()
				move = false


func _on_tirori_finished():
	self.queue_free()
