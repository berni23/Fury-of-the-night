extends Sprite

export(PackedScene) var bala

var speed_bala = 1400

var reload = true

var enemy_range = []

func _on_Area2D_area_entered(area):

	enemy_range.append(area.get_parent())
	print( " Enemic" + str(enemy_range[0].name)+" A punt de mira")


func _on_Area2D_area_exited(area):
	
	enemy_range.erase(area.get_parent())
	
func  _process(delta):
	
	if len(enemy_range)==0 or reload==false:
	
		return

	var Nbala = bala.instance()
	
	var vector_bala= (enemy_range[0].position - self.position).normalized()

	Nbala.speed = vector_bala*speed_bala
	Nbala.t_life= get_node("TowerRange/CollisionShape2D").shape.radius/speed_bala
	
	reload=false
	
	self.add_child(Nbala)

func _on_Timer_timeout():
	
	reload=true
	