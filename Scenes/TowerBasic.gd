extends Area2D

export(PackedScene) var bala
var speed_bala = 1400
var reload = true
var enemy_range = []
var Tower = true

func _ready():

	self.position = get_global_mouse_position()
	
func _on_TowerBasic_area_entered(area):
	
	if area.get("Tower"):
		
		return
		
	enemy_range.append(area.get_parent())
	


func _on_TowerBasic_area_exited(area):
	enemy_range.erase(area.get_parent())

func  _process(delta):
	
	if len(enemy_range)==0 or reload==false:
		
		return

	var Nbala = bala.instance()
	
	var vector_bala= (enemy_range[0].global_position-self.position).normalized()
	print(enemy_range[0].global_position)
	
	
	Nbala.speed = vector_bala*speed_bala
	
	Nbala.t_life= get_node("CollisionShape2D").shape.radius/speed_bala
	
	reload=false
	
	self.add_child(Nbala)

func _on_ReloadTimer_timeout():
	reload = true
